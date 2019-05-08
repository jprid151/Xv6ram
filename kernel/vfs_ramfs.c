#include "types.h"
#include "defs.h"
#include "spinlock.h"
#include "fs.h"
#include "vfs.h"
#include "file.h"
#include "buf.h"
#include "stat.h"
#include "vfs_ramfs.h"

struct vfs_ops ramfs_vfs_ops = {
    .stati = ramfs_stati,
    .ilock = ramfs_ilock,
    .iunlock = ramfs_iunlock,
    .iput = ramfs_iput,
    .writei = ramfs_writei,
    .readi = ramfs_readi};
#define min(a, b) ((a) < (b) ? (a) : (b))
struct inode *
create(char *path, short type, short major, short minor);
//represents a ram disk
struct ram
{
  struct spinlock lock;
  struct rampointer vfiles[20];
  char dirname[14];
};
//tracks all ram disks
struct ram ramdisk[3];
//current disk in use
int currdisc;
//total number of disks
int totaldisc;
//creates and returns a ram disk
struct vfile *ramfs_create(char *path, short type, short major, short minor)
{
  int i2 = 1;
  char dir[14];
  while (i2 > -1)
  {
    strncpy(dir + i2, path + i2, 1);
    char x2 = dir[i2];
    if (x2 == '/' && i2 > 0)
    {
      break;
    }
    i2++;
  }
  int i3 = i2;
  i2 = 0;
  while (i2 < 3)
  {
    int x = strncmp(dir + 1, ramdisk[i2].dirname, i3 - 1);
    if (x == 0)
    {
      currdisc = i2;
      break;
    }
    i2++;
  }
  struct rampointer ip = {
      .pathname = "lol",
      .pointer[0] = kalloc(),
      .maxsize = 4096,
      .size = 0,
      .numchunks = 1};
  int x = strlen(path);
  if (x > 14)
  {
    x = 14;
  }
  strncpy(ip.pathname, path, x);
  acquire(&ramdisk[currdisc].lock);
  for (int i = 0; i < 20; ++i)
  {
    if (ramdisk[currdisc].vfiles[i].pointer[0] == NULL)
    {

      ramdisk[currdisc].vfiles[i] = ip;
      break;
      // cprintf("Allocated vfile #%d\n", i);
    }
    if (i == 19)
    {
      return NULL;
    }
  }

  release(&ramdisk[currdisc].lock);

  return vfile_alloc(ip.pointer[0], &ramfs_vfs_ops);
  //todo
}
//searches for a given ram file name and returns its location.
int ram_search(char *path)
{

  int i2 = 1;
  char dir[14];
  while (i2 > -1)
  {
    strncpy(dir + i2, path + i2, 1);
    char x2 = dir[i2];
    if (x2 == '/' && i2 > 0)
    {
      break;
    }
    i2++;
  }
  int i3 = i2;
  i2 = 0;
  while (i2 < 3)
  {
    int x = strncmp(dir + 1, ramdisk[i2].dirname, i3 - 1);
    if (x == 0)
    {
      currdisc = i2;
      break;
    }
    i2++;
  }
  int i = 0;
  while (i < 20)
  {
    if (strncmp(ramdisk[currdisc].vfiles[i].pathname, path, strlen(path)) == 0)
    {
      ramdisk[currdisc].vfiles[i].currchunk = (ramdisk[currdisc].vfiles[i].size / 4096);
      return i;
    }
    i++;
  }
  return -1;
}

//initializes first ram disk
void ram_init()
{

  initlock(&ramdisk[0].lock, "ram");
  currdisc = 0;
  ramdisk[0].dirname[0] = 'r';
  ramdisk[0].dirname[1] = 'a';
  ramdisk[0].dirname[2] = 'm';
}

//adds a new ram disk
int add_ram(char *path)
{

  if (totaldisc == 2)
  {
    return -2;
  }
  int i = 0;
  while (i < 3)
  {
    if (strncmp(ramdisk[i].dirname, path, 14) == 0)
    {
      return -3;
    }
    i++;
  }
  int x = totaldisc + 1;
  totaldisc++;
  initlock(&ramdisk[x].lock, path);
  int y = strlen(path);
  if (y > 14)
  {
    y = 14;
  }
  strncpy(ramdisk[x].dirname, path, 14);
  return 0;
}
struct rampointer *ram_get(int x)
{
  struct rampointer *vf = &ramdisk[currdisc].vfiles[x];
  return vf;
}

//return info about ram
void ramfs_stati(struct vfile *vfile, struct stat *st)
{
  struct rampointer *rp = vfile->fsp;

  st->dev = 0;
  st->ino = 0;
  st->type = 0;
  st->nlink = 0;
  st->size = rp->size;
}

//unused
int getdiv(int x, int s)
{

  int y = x / 4096;
  x = x + s;
  if (y < x / 4096)
  {
    y += ((x / 4096) - y);
  }
  return y;
}
//return current disk and file num
int get_currdisc(char *ip, int *x1)
{

  int x = 0;
  while (x < 3)
  {
    int x2 = 0;
    while (x2 < 20)
    {

      if (ramdisk[x].vfiles[x2].pointer[0] == ip)
      {
        *x1 = x2;
        return x;
      }
      x2++;
    }
    x++;
  }
  return -1;
}
void ramfs_ilock(struct vfile *vfile)
{
  //None
}

void ramfs_iunlock(struct vfile *vfile)
{
  //None
}

void ramfs_iput(struct vfile *vfile)
{
  //None
}
//write data to the file
int ramfs_writei(struct vfile *vfile, char *src, uint off, uint n)
{
  //TODO
  char *ip = vfile->fsp;
  int x = 0;

  // int size = 0;
  if (n == 4096)
  {
    x = n;
  }
  currdisc = get_currdisc(ip, &x);
  int chunk = getchunk(currdisc, x, off, n);
  if (chunk == -1)
  {
    return -1;
  }

  int nuoff = off + n;
  int srcoff = 0;
  while (off < nuoff)
  {
    if (off == 12287)
    {
      chunk = n;
    }
    chunk = getchunk(currdisc, x, off, n);
    if (chunk == -1)
    {
      return -1;
    }
    ip = ramdisk[currdisc].vfiles[x].pointer[chunk];
    memmove(ip + (off % 4096), src + srcoff, 1);
    srcoff++;
    off++;
    ramdisk[currdisc].vfiles[x].size++;
  }
  return n;
}

//read data from the file
int ramfs_readi(struct vfile *vfile, char *src, uint off, uint n)
{
  //TODO
  char *ip = vfile->fsp;

  int x = 0;
  // int size = 0;
  currdisc = get_currdisc(ip, &x);
  if (off == 8702)
  {
    int temp = x;
    x = temp;
  }
  int chunk = getchunk(currdisc, x, off, n);
  if (chunk == -1)
  {
    return -1;
  }
  // int size = ramdisk[currdisc].vfiles[x].size;

  int nuoff = off + n;
  int srcoff = 0;
  int numread = 0;
  while (off < nuoff)
  {
    if (off >= ramdisk[currdisc].vfiles[x].size)
    {
      return numread;
    }
    if (off == 8192)
    {
      chunk = 0;
    }
    chunk = getchunk(currdisc, x, off, n);
    if (chunk == -1)
    {
      return -1;
    }
    ip = ramdisk[currdisc].vfiles[x].pointer[chunk];
    memmove(src + srcoff, ip + (off % 4096), 1);
    srcoff++;
    off++;
    numread++;
  }
  return n;
}
//ensures that drive exists
int has_ram(char *path)
{

  int x = 0;
  int ch = 1;
  while (ch < strlen(path))
  {
    if (path[ch] == '/' && ch > 0)
    {
      break;
    }
    ch++;
  }
  while (x < 3)
  {
    if (ch == 1)
    {
      if (strncmp(ramdisk[x].dirname, path, ch) == 0)
        return 0;
    }
    else
    {
      if (strncmp(ramdisk[x].dirname, path + 1, ch - 1) == 0)
      {
        return 0;
      }
    }
    x++;
  }

  return -1;
}
//unused
int allocnew(int curr, int c2, int ptr, int amt)
{
  int x = ramdisk[curr].vfiles[c2].currchunk + 1;
  int y = 0;
  while (x <= amt)
  {
    ramdisk[curr].vfiles[c2].pointer[x] = kalloc();
    vfile_alloc(ramdisk[curr].vfiles[c2].pointer[x], &ramfs_vfs_ops);
    x++;
    y++;
  }
  ramdisk[curr].vfiles[c2].currchunk++;
  return ramdisk[curr].vfiles[c2].currchunk;
}

//gets the active chunk or allocs a new one
int getchunk(int curr, int c2, int off, int amt)
{
  int nuoff = off;
  //int x = nuoff % 4096;
  nuoff = nuoff / 4096;
  if (nuoff < (ramdisk[curr].vfiles[c2].numchunks))
  {

    return nuoff;
  }
  else
  {

    int y = ramdisk[curr].vfiles[c2].numchunks;
    if (y == 16)
    {
      return -1;
    }
    ramdisk[curr].vfiles[c2].pointer[y] = kalloc();
    ramdisk[curr].vfiles[c2].numchunks++;

    ramdisk[curr].vfiles[c2].currchunk++;
    return y;
  }
}