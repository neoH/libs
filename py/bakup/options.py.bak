#! /usr/bin/env python3

import re;
import coms;

"""
----------------------------------------------------------------------------------------------------
This is a class for options check and detect, detailed feature list of this
class please see document "Python Library.docx"
----------------------------------------------------------------------------------------------------
inputs:
	all inputs should be provided when initial the options class.
----------------------------------------------------------------------------------------------------
outputs:
----------------------------------------------------------------------------------------------------
"""

class options:


	## Var: __g_debug__
	##
	## Debug switch, if True, then will print debug information. Default is False.
	##
	__g_debug__ = False;

	## Var: __g_opts__
	##
	## A dict of all recognized options
	##
	## Format of this dict
	##
	## -- ['opt_name_0']:
	## ---- ['type','times','param_0','param_1', ... ...]
	## -- ['opt_name_1']:
	## ---- ['type','times','param_0','param_1', ... ...]
	__g_opts__ = {};

	## Var: __g_sopts__
	##
	## Dict storing all supported options.
	## Format:
	## -- {'V'}: 'T'
	## -- 'V': the name of option
	## -- 'T': the type of option, valid within 'P' or 'NP'
	##
	__g_sopts__ = {};

	## Var: __g_uopts__
	##
	## List type for storing unsupported options.
	##
	__g_uopts__ = [];


	## Var: __g_err_flag__
	##
	## Bool type var indicates if error occurred in using this lib
	##
	__g_err_flag__ = False;


	def __init__(self,argvs,sopts = None,debug = False,flag = '-'): ## {
		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		headers = []; ## list typed var for storing all option head flags.
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## 1. setting __g_debug__
		## 2. getting flag list: headers, by calling __opt_head_split__(flag)
		## 3. delete the first item of argvs, which indicates the program name.
		## 4. loop the argvs, each loop will get argv in argvs.
		## 4.1. call __opt_head_match__(argv,headers), which will return bool value.
		## 4.1.1. if returned True, then delete the first char of opt, and check if argv in __g_sopts__
		## 4.1.1.1. if exists, then get the opt type
		## 4.1.1.1.1. if is 'P' type, then pop the next argv and call __opt_head_match__(argv,headers).
		## 4.1.1.1.1.1. if return True, then print error, set __err_flag__ to True and return,
		## 4.1.1.1.1.2. else record this argv to the specified opt.
		## 4.1.1.1.2. else regarded as 'NP' type, then record this opt to __g_opts__;
		## 4.1.2. else if returned False, then append this opt into __g_uopts__.
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		self.__g_debug__ = debug;
		headers = self.__opt_head_split__(flag);
		self.__g_sopts__ = sopts;
		del argvs[0];

		while len(argvs): ## {
			argv = argvs.pop(0);
			if self.__opt_head_match__(argv,headers): ## {
				argv = argv[1:]; ## delete the head of option
				if argv in self.__g_sopts__: ## {
					if self.__g_sopts__[argv] == 'P': ## {
						param = argvs.pop(0);
						if self.__opt_head_match__(param,headers): ## {
							## next item in argvs is a recognizable opt, not an param, need print error and return
							self.__g_err_flag__ = True;
							coms.error("Invalid parameter found: "+param+", which has the valid option header.");
						## }
						else: ## {
							## next item is a legal parameter, then to check in this option and param.
							self.__opt_insert__(argv,'P',param); ## call __opt_insert__ to insert one opt into __g_opts__
						## } end if
					## }
					elif self.__g_sopts__[argv] == 'NP': ## {
						## this opt is NP typed.
						self.__opt_insert__(argv,'NP'); ## call __opt_insert__ to insert one opt into __g_opts__
					## } end if
				## } end if argv
			else:
				self.__g_uopts__.append(argv); ## if head not match, then it is not supported opt type.
			## } end if : self.__opt_head_match__
		## } end while : len

		return;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## } end def : __init__



	def pop_option(self,opt): ## {
		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## 1. check if opt exists in __g_opts__
		## 1.1. if exists, then check the type
		## 1.1.1. if type is 'P', then return the first item of __g_opts__, and del this item and decrease the time
		## 1.1.2. else if type is 'NP', then return True
		## 1.2. else if not exists, then return False.
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		if opt in self.__g_opts__: ## {
			## check opt type
			if self.__g_opts__[opt][0] == 'P': ## {
				## if has parameter, then get the first parameter
				rtn = self.__g_opts__[opt][2];
				if self.__g_opts__[opt][1] == 1: ## {
					del self.__g_opts__[opt]; ## if time of this opt is only 1, then to delete this opt in __g_opts__
				## }
				else: ## {
					## else time is not 1, then to decrease one time, and delete the first item of param
					del self.__g_opts__[opt][2];
					self.__g_opts__[opt][1] -= 1;
				## } end if
				## after processing the __g_opts__ status, then to return the first parameter.
				## here to do noting, program will execute the return feature.
			## }
			elif self.__g_opts__[opt][0] == 'NP': ## {
				## if type is NP, then to process the __g_opts__ first as P type
				rtn = True;
				if self.__g_opts__[opt][1] == 1: ## {
					del self.__g_opts__[opt]; ## if time of this opt is only 1, then to delete this opt in __g_opts__
				## }
				else: ## {
					del self.__g_opts__[opt][2];
					self.__g_opts__[opt][1] -= 1;
				## } end if
				## after processing the __g_opts__ status, then to return the first parameter.
				## here to do noting, program will execute the return feature.
			## } end if
		## }
		else: ## {
			## if opt not in __g_opts__, then return False.
			rtn = False;
		## } end if
		return rtn;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## } end def : pop_option

	def pop_options(self,opt):
		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		## Var: rtn
		## List type return var, its format is:
		## -- [0]  : option type
		## -- [1]  : called times
		## -- [...]: parameters
		rtn = [];
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		if opt in self.__g_opts__: ## {
			## if opt exists, then return corresponding list contains all option information.
			rtn = self.__g_opts__[opt];
		## }
		else: ## {
			rtn = False; ## else return False
		## } end if

		return rtn;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## end def : pop_options


	def __opt_head_split__(self,f_line):
		"""
			This function to split the flags in one string line, and return the flag list.
			-------------------------------------------------------------------------------------------------------------------------------------------
			Args:
			-- f_line: string of flags, which may seperated by '|', need to split.
		"""
		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		rtn = [];
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		if re.search('|',f_line):
			rtn = f_line.split('|'); ## if exists '|', then split the f_line and assigned to rtn list
		else:
			rtn.append(f_line); ## if not exists '|', then append f_line to rtn list directly.
		## end if : re.search
		return rtn;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## end def : __opt_head_split__

	def __opt_head_match__(self,argv,headers):
		"""
			This function to detect the option head match information, if matched, then return True, else
			return False.
			-------------------------------------------------------------------------------------------------------------------------------------------
			Args:
			-- argv: string typed var, which from system command line directly
			-- headers: list for recording all supported option headers.
			-------------------------------------------------------------------------------------------------------------------------------------------
		"""
		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		rtn = False;
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		for header in headers:
			obj_h = re.match('^'+header,argv);
			if obj_h:
				## if matched current header, then change rtn to True and break.
				rtn = True;
				break;
			## end if : obj_h
		## end for : header
		return rtn;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## end def : __opt_head_match__

	def __opt_insert__(self,opt,T, param = None): ## {
		"""
			Function to insert a give option and parameter to __g_opts__
			-------------------------------------------------------------------------------------------------------------------------------------------
			Args:
			-- opt: option name
			-- T: option type, P or NP
			-- param: parameter, default is None
			-------------------------------------------------------------------------------------------------------------------------------------------
			Rtns:
			-- No return
			-------------------------------------------------------------------------------------------------------------------------------------------
		"""

		## -- Declaration ----------------------------------------------------------------------------------------------------------------------------
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Procedure ------------------------------------------------------------------------------------------------------------------------------
		## 1. check if current opt exists in __g_opts__,
		## 1.1. if exists, then add the time field: [1], and then check T, if is 'P', then append __g_opts__
		## 1.2. else if not exists, then create a new list to add [0] -> 'name', [1] -> 'time', [2] -> 'param'
		## -------------------------------------------------------------------------------------------------------------------------------------------

		## -- Code -----------------------------------------------------------------------------------------------------------------------------------
		if opt in self.__g_opts__: ## {
			## if opt in __g_opts__, then to insert this option: increase time once, and append the opt list if T is 'P'
			self.__g_opts__[opt][1] += 1;
			if self.__g_opts__[opt][0] == 'P': self.__g_opts__[opt].append(param); ## if type of opt in __g_opts__ is 'P', then to append the parameter, else do nothin
		## }
		else: ## {
			## else if opt not in __g_opts__, then to create a new list and set to __g_opts__
			opt_item = [];
			if T == 'P': opt_item = [T,1,param]; ## if T is 'P', then set opt_item with param.
			else: opt_item = [T,1];              ## else T is 'NP;, then set opt_item with no param
			self.__g_opts__[opt] = opt_item;     ## insert this dict item to __g_opts__
		## } end if
		return;
		## -------------------------------------------------------------------------------------------------------------------------------------------
	## } end def : __opt_insert__

## end class : options
