#! /usr/bin/env python3


"""
---------------------------------------------------------------------------------------------
# File    : options.py
# Author  : Neo.H
# Date    : Sep 19, 2018
# Version : v1.00
---------------------------------------------------------------------------------------------
This is a class for options check and detect.
----------------------------------------------------------------------------------------------------
inputs:
	-- support options.
	-- input command options.
----------------------------------------------------------------------------------------------------
outputs:
	-- supported APIs
----------------------------------------------------------------------------------------------------
APIs:
	-- pop_option: pop one option dict handler, which contains the option information.
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
"""

import re;

class options: ## {

	__owner__ = 'Neo.H';

	## the dict to store all supported formated options, this var is valid for comparison.
	## value format of this var is:
	## {'opt_name'}: 'formatted_opt'
	__opts_f = {};

	## the dict stores user enterred options, its format is:
	## ['opt_name']:
	## -> ['num']: number
	## -> ['param']: parameter
	__uopts = {};

	def __init__(self,argvs,sopts): ## {
		"""
		the format of sopts is:
		-- sopts['name']:
			-> ['param']: parameter of this option
			-> ['fmt']: format of this option
			-> ['desc']: description
		In initial function, the program will get option from argvs list, and then check if support
		sopts.
		"""
		## opt_f, a list for specified options, used to check directly with input options.
		self.__get_format_opts(sopts);
		while len(argvs): ## {
			argv = argvs.pop();
			## opt_mrst: the result of option matched func.
			opt_mrst = self.__opt_matched(argv);
			## if the argv checked, then according to the return type to do following procedure.
			## the return value of this func. is an dict
			if opt_mrst != None: ## {
				## first the result is not None
				## need to add one option to __uopts.
				if opt_mrst['result'] == True: ## {
					## if the func. return True, that means the func. matched a option that with '-' preffixed, then need
					## to check the option param, if is not None, then need to check the next argv as the parameter.
					## step 1. check the next arg and opt format
					## step 2. call self.__opt_insert()
					if sopts[opt_mrst['name']]['param'] != None: ## {
						## the supported option type has parameter, so if the next item of argvs is not a parameter, then need to report fatal and exit the program.
					## }
				## }
				else: ## {
					##
				## }
			## }
		## }
		return;
	## }


	def exists(self,opt): ## {
		"""
		check if the option specified by argument is exists, if is, then return True, else return False.
		here the exists means corresponding option enterred by user.
		"""
	## }

	def pop_option(self,): ## {
		"""
		A func. to pop one option according to the option name and delete the item in option list. If no
		corresponding option handler found, then return None. So for multipile options, use while (pop_option())
		to pop until no corresponding option exists.
		"""
	## }

	## ---------------------------------------------------------------------------------------------------- ##

	## an internal func. to check if the input argv of current index matched the supported option formats
	## here need to pay a attention that the formatf of argvs that preffixed with '+' contains the parameter
	## in the same argv variable.
	def __opt_matched(self,argv): ## {
		"""
		if matched, then return a dict object of this option:
			rtn['name']: <opt_name>,
			rtn['result']:
			-> for '-' typed option, return True only,
			-> for '++' or '+=' typed option, return the parameter of this option.
		"""
		rtn = {};
		opts = self.__opts_f.keys();
		for opt in opts: ## {
			## loop all the supported options, and use match to check if opt_f matched the argv
			obj = re.match(self.__opts_f[opt],argv);
			if obj != None: ## {
				## if matched, check the first char
				rtn['name'] = opt;  ## set the return name.
				if opt[0] == '-': ## {
					## type of this opt is '-', return True only
					rtn['result'] = True;
				## }
				else if opt[0] == '+': ## {
					## type of this opt is '+', need to get the parameter
					rtn['result'] = argv[obj.end():];
				## }
				return rtn; ## here the obj is not None, so need to return rtn.
			## }
		## }
		## after executed all opts, none has matched, then return None.
		return None;
	## }

	def __get_format_opts(self,sopts): ## {
		"""
		A func. to get from sopts dict, and return to a list that contain options can be compared with input
		command options directly.
		"""
		opts = sopts.keys();

		for opt in opts: ## {
			if sopts[opt]['fmt'] == '-': ## {
				## this block indicates the format of -opt <param>
				self.__opts_f[opt] = '-'+opt;
			## }
			else if sopts[opt]['fmt'] == '++': ## {
				## this block indicates the format of option: +opt+<param>, in this format, the option must has
				## parameter.
				self.__opts_f[opt] = '+'+opt+'+';
			##}
			else if sopts[opt]['fmt'] == '+=': ## {
				## this block indicates the formatf of option: +opt=<param>, in this format, the option must has
				## the parameter.
				self.__opts_f[opt] = '+'+opt+'=';
			## }
			else: ## {
				print(" [SFATAL][options] fatal error occurred when calling __get_format_opts, developer fatal. Please contact creator: "+self.__owner__);
			## }
		## }
		return;
	## }
	## ---------------------------------------------------------------------------------------------------- ##

## }
