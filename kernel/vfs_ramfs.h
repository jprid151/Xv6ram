#ifndef VFS_ram_H
#define VFS_ram_H

extern struct vfs_ops ramfs_vfs_ops;


struct rampointer {

  char pathname[15]; // path to file
  int maxsize; //unused
  int size; //current file size
  char *pointer[16]; //pointers to file memory
  int currchunk; //current mem chunk
  int numchunks; //number of chunks active
};


struct vfile* ramfs_create(char *, short, short, short);
void ramfs_stati(struct vfile *, struct stat *st);
void ramfs_ilock(struct vfile*);
void ram_init();
int ram_search(char *);
struct rampointer* ram_get(int);
void ramfs_iunlock(struct vfile*);
void ramfs_iput(struct vfile*);
int ramfs_writei(struct vfile*, char *src, uint off, uint n);
int ramfs_readi(struct vfile*, char *src, uint off, uint n);
int add_ram(char*);
int has_ram(char*);
int get_currdisc(char*, int*);
int getdiv(int,int);
int allocnew(int,int,int,int);
int getchunk(int,int,int,int);
#endif