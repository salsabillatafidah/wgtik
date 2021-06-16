#ifndef TUGASQUEUE_H_INCLUDED
#define TUGASQUEUE_H_INCLUDED
#define info(P) P->info
#define head(Q) Q.head
#define tail(Q) Q.tail

const int NMax = 100;
typedef int infotype queue{
    infotype info[NMax-1];
    int head;
    int tail;
}

void add(queue &Q, infotyp P);
void del(queue &Q, infotype &P);



#endif // TUGASQUEUE_H_INCLUDED

/* Nama : Salsabilla Tafida Haerus
NIM : 1303190038 */
