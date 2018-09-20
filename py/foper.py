#! /usr/bin/env python3

"""
This file defined relative function to operate files
"""

import re;
import os;

def exists(file): ## {
	if os.path.exists(file): return True;
	else: return False;
## }

def get_all_cnt(file_name,cnts):
	f_h = open(file_name,"r");
	for line in f_h.readlines():
		cnts.append(line.strip('\n'));
	## end for
	f_h.close();
	return;
## end def

## =========================================================================
## Func : winnow_comments_one
## Descp: winnow comments, symbol of this function must be only one
## =========================================================================
def winnow_comments_one(symbol,cnts):
	r_cnts = [];
	for cnt in cnts:
		if re.search(' *'+symbol,cnt):
			match_h = re.search(' *'+symbol,cnt);
			if match_h.start(): r_cnts.append(cnt[0:match_h.start()]);
		else:
			r_cnts.append(cnt);
	## end for
	del cnts[:];
	for r_cnt in r_cnts: cnts.append(r_cnt);
	return;

## end def

## =========================================================================
## Func : winnow_comments
## Descp: winnow comments, symbol of this function can be multi-types.
## =========================================================================
def winnow_comments(symbol,cnts):
	symbols = [];
	r_cnts  = [];
	if re.search('|',symbol): symbols = symbol.split('|');
	else: symbols.append(symbol);

	for s_item in symbols:
		winnow_comments_one(s_item,cnts);
	## end for

	return;
## end def

def write_cnts(file_name,cnts):
	f_h = open(file_name,"w");
	for line in cnts:
		f_h.write(line+'\n');
	## end for
	f_h.close();
## end def : write_cnts
