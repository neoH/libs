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
Exceptions:
	-- INVOPT, invalid option input,
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
	## -> [0]:
	## --> ['index']: number
	## --> ['param']: parameter
	## -> [1]:
	## --> ['index']: number
	## --> ['param']: parameter
	__uopts = {};

	__einfo = {
		'INVOPT': 'invalid option enterred by user',
	};

	def load(self,argvs,sopts): ## {
		"""
		load func. to load and check user enterring, if load success, then return 0, else return -1.
		the format of sopts is:
		-- sopts['name']:
			-> ['param']: parameter of this option
			-> ['fmt']: format of this option
			-> ['desc']: description
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
						## the supported option type has parameter, so if the next item of argvs is not a parameter,
						## then need to report fatal and exit the program.
						nargv = argvs.pop();
						if nargv[0] == '-' or nargv[0] == '+' or nargv == None: ## {
							## report && return -1
							self.__error_rpt('INVOPT'," option: "+argv); return -1;
						## }
						else: ## {
							## else block to set the param to self.__uopts dict.
							self.__uopt_insert(opt_mrst['name'],nargv);
						## }
					## }
					else: ## {
						## else if current option has no parameter
						self.__uopt_insert(opt_mrst['name']); ## call insert with no param arg.
					## }
				## }
				else: self.__uopt_insert(opt_mrst['name'],opt_mrst['result']); ## this block indicates the return result contains the parameter
			## }
		## }
		return 0;
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

	def __error_rpt(self,ID,ext = ""): ## {
		"""
		A func. to print error information according to input error ID and message in class.
		"""
		if ID in self.__einfo: print ("options: [*E,"+ID+"] "+self.__einfo[ID]+ext);
		return;
	## }

	def __uopt_insert(self,opt,param = None):
		"""
		A func. to insert options to self.__uopts according to input args. If input opt already exists, then to
		add the appearring time, else creating the new list.
		detailed format of self.__uopts please see field declaration.
		"""

		uopt_dict = {};

		if opt in self.__uopts: ## {
			## if opt already exists in __uopts, then to get current index by len(),
			## and create a new dict and append to __uopts.
			index = len(self.__uopts[opt]);
			## create a uopt dict
			uopt_dict['index'] = index;
		## }
		else: ## {
			## else block, the opt not exists in __uopts, then need to create a new dict item
			self.__uopts[opt] = []; ## create a new empty list
			uopt_dict['index'] = 0; ## set the index of opt list to 0.
		## }
		uopt_dict['param'] = param;
		self.__uopts[opt].append(uopt_dict); ## append the dict to the corresponding opt list.

		return; ## return void
	## }


	## ---------------------------------------------------------------------------------------------------- ##

## }
