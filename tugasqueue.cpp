#include"queue.h"

void add(queue &Q, infotype P){
    if(head(Q) == 0 && tail(Q) == NMax-1) {
        cout<< "full"
    } else {
        if(head(Q) == -1 && tail(Q) == -1) {
            head(Q) = head(Q) + 1;
        }
        tail(Q) = tail(Q) + 1;
        info(Q)[tail(Q)] = P;
    }
}

void del(queue &Q, infotype &P){
    if(head(Q) == -1 && tail(Q) == -1) {
        cout << "stack kosong"
        P = head(Q);
    } else {
        P = info(Q)[head(Q)];
        i = 0;
        while (i<tail(Q){
               info(Q)[i] = Q[i -1];
               i ++;
        }
        tail(Q) = tail(Q) - 1;
        if(tail(Q) == -1) {
            head(Q) = -1;
        }
    }
}

/* Nama : Salsabilla Tafida Haerus
NIM : 1303190038 */
