#pragma once
#if defined(__cplusplus)
extern "C"{
#endif 
void mdafl_gc_log(int index, int share, int is_negated, long long * low, long long * high, long long * expr, int andor);

#if defined(__cplusplus)
}
#endif
