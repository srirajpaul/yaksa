##
## Copyright (C) by Argonne National Laboratory
##     See COPYRIGHT in top-level directory
##

AM_CPPFLAGS += -I$(top_srcdir)/src/backend/seq/pup

libyaksa_la_SOURCES += \
	src/backend/seq/pup/yaksuri_seq_pup.c \
	src/backend/seq/pup/yaksuri_seqi_pup_char.c \
	src/backend/seq/pup/yaksuri_seqi_pup_double.c \
	src/backend/seq/pup/yaksuri_seqi_pup_float.c \
	src/backend/seq/pup/yaksuri_seqi_pup_int.c \
	src/backend/seq/pup/yaksuri_seqi_pup_int16_t.c \
	src/backend/seq/pup/yaksuri_seqi_pup_int32_t.c \
	src/backend/seq/pup/yaksuri_seqi_pup_int64_t.c \
	src/backend/seq/pup/yaksuri_seqi_pup_int8_t.c \
	src/backend/seq/pup/yaksuri_seqi_pup_long.c \
	src/backend/seq/pup/yaksuri_seqi_pup_long_double.c \
	src/backend/seq/pup/yaksuri_seqi_pup_long_long.c \
	src/backend/seq/pup/yaksuri_seqi_pup_short.c \
	src/backend/seq/pup/yaksuri_seqi_pup_wchar_t.c

include src/backend/seq/pup/Makefile.pup.mk
