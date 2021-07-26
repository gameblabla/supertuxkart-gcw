#ifndef GLOBAL_CONFIG_H
#define GLOBAL_CONFIG_H

#ifdef FUNKEY
#define CURRENT_RES_WIDTH 240
#define CURRENT_RES_HEIGHT 240
#else
#define CURRENT_RES_WIDTH 320
#define CURRENT_RES_HEIGHT 240
#endif

#ifdef _16BPP
#define CURRENT_BPP 16
#else
#define CURRENT_BPP 32
#endif

#endif
