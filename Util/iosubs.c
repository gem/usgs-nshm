/* io subroutines for hazard programs, last modified 10/2006 */
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

FILE *fporg,*fp[10];
int FILE_POINTER = 1;

//long int index;
struct header
{
   char name[30][6];
   float period;
   int nlev;
   float xlev[20];
   float extra[10];
};
struct header *headr;

// This needs be done before anything that uses iosubs
void initialize_() {
	int i;
	for(i=0; i < 10; ++i) 
		fp[i] = NULL;
}

void openr_(name,len)
char name[];
int len;
{
       int i;
       char st[30];
       for(i=0; i<30; i++) st[i]= '\0';
       for(i=0; i<30 && name[i] != ' ' && name[i] != '\n' ; i++)
          st[i]=name[i];
       if((fp[0]=fopen(st,"rb"))==NULL) {
          fprintf(stderr,"cant open %s\n",st);
       exit(1);
       }
}

void openw_(name,len)
char name[];
int len;
{
       int i;
       char st[30];
       for(i=0; i<30; i++) st[i]= '\0';
       for(i=0; i<30 && name[i] != ' ' && name[i] != '\n' ; i++)
          st[i]=name[i];
       if((fp[0]=fopen(st,"wb+"))==NULL) {
          fprintf(stderr,"cant open %s\n",st);
       exit(1);
       }
}

void openwx_(fpx,name)
char name[];
int *fpx;
//int *ip;
{
       int i, j;
       char st[30];
       for(i=0; i<30; i++) st[i]= '\0';
       for(i=0; i<30 && name[i] != ' ' && name[i] != '\n' ; i++)
          st[i]=name[i];
       if((fporg=fopen(st,"wb")) < 0) {
          fprintf(stderr,"cant open %s\n",st);
          exit(1);
       }
       *fpx = FILE_POINTER;
       fp[FILE_POINTER++] = fporg;
       printf("fpx %u\n",*fpx);
}

void close_()
{
	int j;
		for (j=0;j<10;j++) {
			if(fp[j]!=NULL) {
				if(fclose(fp[j])!= 0) {
					fprintf(stderr,"cant close \n");
				}
			}
		}
}

void closeio_(name)
char name[];
{
	int j;
	for(j=0; j< 10; ++j) {
		if(fp[j]!=NULL) {
			if(fclose(fp[j])!=0) {
				fprintf(stderr,"Failed to close, likely not ever opened.\n");
			}
		}
	}
}

void getbuf_(buf,bufsiz,readn)
long int *bufsiz,*readn;
short int *buf;
{
       *readn= fread(buf,2,*bufsiz,fp[0]);
}

void getbuf2_(buf2,bufsiz,readn)
long int *bufsiz,*readn;
float *buf2;
{
       *readn= fread(buf2,4,*bufsiz,fp[0]);
}

void getbuf3_(buf2,bufsiz,readn,skip)
long int *bufsiz, *readn;
long int *skip;
float *buf2;
{
       fseek(fp[0], *skip, 0);
       *readn= fread(buf2,4,*bufsiz,fp[0]);
}

void putbuf2_(buf2,bufsiz,readn)
long int *bufsiz,*readn;
float *buf2;
{
       *readn= fwrite(buf2,4,*bufsiz,fp[0]);
}

void putbuf_(buf2,bufsiz,readn)
long int *bufsiz,*readn;
short int *buf2;
{
       *readn= fwrite(buf2,2,*bufsiz,fp[0]);
}

void putbufx_(fpx,buf2,bufsiz,readn)
//int *ip;
long int *bufsiz,*readn;
float *buf2;
int *fpx;
{
       *readn= fwrite(buf2,4,*bufsiz,fp[*fpx]);
}

void puthead_(fpx,headr,bufsiz,readn)
struct header *headr;
long int *bufsiz,*readn;
int *fpx;
{
       *readn= fwrite(headr,*bufsiz,1,fp[*fpx]);
}

void gethead_(headr,bufsiz,readn)
struct header *headr;
long int *bufsiz,*readn;
{
      *readn= fread(headr,*bufsiz,1,fp[0]);
}
