#! /usr/bin/env python3


"""
---------------------------------------------------------------------------------------------
# File    : options.py
# Author  : Neo.H
# Date    : Oct 8, 2018
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
	-- INVPRF, invalid option preffix
	-- ILLFMT, illegal option format.
	-- UROPT, unrecognized options, this option probably may ignored.
----------------------------------------------------------------------------------------------------
"""

import re;


class options:
	"""
	This is a class module for processing options that will be called by other programmer.
	"""

	## the var indicates the owner
	__owner__ = 'Neo.H';

	## the supported options format, this list will be inserted by an API called set_support
	## it is support option list that contains all supported option information.
	## format:
	## [0]:
	## -- ['name']
	## -- ['pre']
	## -- ['suf']
	## -- ['param']
	## -- ['descp']
	##
	__sp_opts__ = [];



	## the list to store all formated user enterred options.
	## format:
	## [<name>]:
	## -- [0]: parameter of the first index, which means the first time checked this option, if not exists, then eq to None.
	## -- [1]: parameter of the second index.
	## -- ... ...
	__fmt_argvs__ = {};

	## the check switch, if this var enabled, then the module will check the argvs in loading,
	## first of all, if this switch enabled, then all support options must be inserted before load.
	##
	__check__ = False;

	def __init__(self, chk = False): ## {
		"""
		The constructor, to set check switch and instantiate the option class.
		"""
		self.__check__ = chk;
		return;
	## }


	def set_support (self, name, pre = '-', suf = ' ', param = None, descp = None): ## {
		"""
		This is an API to insert supported options, also containing descriptions, so the legal input args are lists as the following:
		-- name: the option name, this option must be specified when calling this API.
		-- pre : prefix of option, default is '-'
		-- suf : suffix of option, default is ' '
		-- param: the parameter of option, in this func. it indicates the parameter name. default is None, which indicates no parameter.
		-- descp: description of this option, which will be displayed in option help mode.
		--------------------------------------------------------------------------------------------------------------------------------
		Exceptions:
		-- already registered.
		--------------------------------------------------------------------------------------------------------------------------------
		"""

		for opt in self.__sp_opts__: ## {
			## this loop to search if new insert option has already registered previous, if is, then a warning will be reported and
			## this func. will return.
			if opt['name'] == name: ## {
				## if option name has already registered
				self.__excpt__("option name ("+name+") has already registered previous, this calling will be ignored.");
				return False;
			## }
		## }
		## after search all list, and not previously registered, then to do the next.
		nopt = {}; ## declare a dict as new opt dict.
		nopt['name']  = name;
		nopt['pre']   = pre;
		nopt['suf']   = suf;
		nopt['param'] = param;
		nopt['descp'] = descp;
		__sp_opts__.append(nopt);
		return True;
	## }


	def load (self, argvs):
		"""
		An API to load the argvs that input by user who calling the program tool.
		-------------------------------------------------------------------------------------------------------------
		Exceptions:
		-- input format illegal, which means if the option has parameter, but no param found in argvs for this option,
		then the exception will raised. Only valid when __check__ switch is True.
		-------------------------------------------------------------------------------------------------------------
		Return:
		-- True : none exception occur.
		-- False: exception occurred.
		-------------------------------------------------------------------------------------------------------------
		"""
		for argv_item in argvs:
			opt = self.__opt_match__(argv_item);
			if opt != None:
				## if opt not None, which means opt matched, then according to the suf,
				## if is ' ' and sp_param is not None, then to get the next argv as param
				##
				param = self.__get_param__(opt,argvs);
				if param == None: return False; ## if get None of param, which means exception occurred, need to return immediately.
				if param != False: self.__set_fmt_argv__(opt,param); ## call this func. to insert current opt & param into self.__fmt_argvs__
				else: self.__set_fmt_argv__(opt); ## else insert into argvs without param.





	def __get_param__(self,opt,argvs):
		"""
		A internal func. to get parameter from user commond entering, first to search supported type according to input option, then
		to check parameter type.
		if param not detected but in support list it has param, then report error and return None.
		-------------------------------------------------------------------------------------------------------------
		Return:
		-- None: exception occurred
		-- False: current option has no parameter
		-- string: the param value.
		-------------------------------------------------------------------------------------------------------------
		"""
		if self.__get_sp_param__(opt) != None:
			if self.__get_sp_suf__(opt) == ' ':
				## only if the returned sp_param is not None and suffix is ' ', then it means need
				## to get the next argv as parameter.
				param = argvs.pop(); ## pop next item from the argvs list.
				if self.__is_opt__(param):  ## {
					print (" ERROR, IOPTF: no available parameter detected for option ("+opt+")."); ## print illegal format exception
					return None;
				## }
			else:
				## else if the suffix is not ' ' and in this block, sp_param is also not None, then to check the remained string of this argv


## }
