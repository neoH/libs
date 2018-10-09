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
	__dbg__ = False;

	## unsupported argument list, all args not recognized by this class will be sotred here.
	##
	__usp_args__ = [];

	def __init__(self, dbg = False): ## {
		"""
		The constructor, to set check switch and instantiate the option class.
		"""
		self.__dbg__ = dbg;
		return;
	## }


	def set_support (self, name, descp = None, param = False, pre = '-', suf = ' '): ## {
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
		self.__sp_opts__.append(nopt);
		return True;
	## }


	def load (self, argvs):
		"""
		An API to load the argvs that input by user who calling the program tool.
		-------------------------------------------------------------------------------------------------------------
		Exceptions:
		-- input format illegal, which means if the option has parameter, but no param found in argvs for this option,
		then the exception will raised. Only valid when switch is True.
		-------------------------------------------------------------------------------------------------------------
		Return:
		-- True : none exception occur.
		-- False: exception occurred.
		-------------------------------------------------------------------------------------------------------------
		"""
		self.__debug_info__("load","drop the program name: "+argvs.pop(0)); ## to pop the invalid item: the tool name first
		for argv_item in argvs: ## {
			opt = self.__opt_match__(argv_item);
			if opt != None: ## {
				## if opt not None, which means opt matched, then according to the suf,
				## if is ' ' and sp_param is not None, then to get the next argv as param
				##
				param = self.__get_param__(opt,argv_item,argvs);
				if param == None: return False; ## if get None of param, which means exception occurred, need to return immediately.
				self.__set_fmt_argv__(opt,param); ## if param == False, that means current option has no parameter.
			## }
			else: ## {
				## else if opt is none, which means current argv not recognized by the sp. list,
				## these args will be push into the self.__usp_args__, and may probably used by the program.
				self.__usp_args__.append(argv_item);
			## }
		## }
	## end def }

	def exists(self,opt): ## {
		"""
		Program to check if the given option exists in the __fmt_argvs__, no matter the option with param or no param
		"""

		if opt in self.__fmt_argvs__: return True;
		else: return False;

	## end def }

	def get_param(self,opt): ## {
		"""
		Func. to get the parameter according to input option, this func will first check if the option exists in the __fmt_argvs__,
		if not exists, then return False, else if get the param, then return the param, and besides, should delete the item in __fmt_argvs__
		"""

		## first to call exists to check if exists
		if self.exists(opt): ## {
			## if exists, then need to get the parameter of this option
			return self.__fmt_argvs__[opt].pop(0); ## return the first item in option list.
		## }
		else: return False;

	## end def }


	def descript(self):
		"""
		A function to display all supported information, and only display the option information.
		------------------------------------------------------------------------------------------
		display format:
		<prefix>option_name<suffix> <<param>>: <description>
		"""

		for opt in self.__sp_opts__: ## {
			## loop for display
			display_info = opt['pre']+opt['name']+opt['suf'];
			if opt['param'] != False: display_info += "<"+opt['param']+">"; ## if the parameter is not False, then to add param value
			display_info += ": "+opt['descp'];
			print (display_info);
		## }

		return;

	## end def }



	## APIs definition above
	## -------------------------------------------------------------------------------------------------------------------- ##




	def __set_fmt_argv__(self,opt,param = False): ## {
		"""
		A func. to set formated args into self.__fmt_argvs__, which is a dict indexed by option name, and stores
		a list, the list countered the input times by user.
		"""
		## step 1. check if the option name already registered
		if opt in self.__fmt_argvs__: ## {
			## if this index has already exists the dict.
			self.__fmt_argvs__[opt].append(param); ## append the opt list with another param
		## }
		else: ## {
			## else if this index not exists in the dict.
			opt_list = [param];
			self.__fmt_argvs__[opt] = opt_list; ## assign a new option list to a newly generated key.
		## }
		return; ## return null.
	## end def }


	def __opt_match__(self,argv): ## {
		"""
		A function to match if current argv item matched the option in __sp_opts__ lib.
		------------------------------------------------------------------------------------------------------------
		Return:
		-- if matched, then return the option name.
		-- else if not matched, then return None.
		------------------------------------------------------------------------------------------------------------
		"""
		for opt_item in self.__sp_opts__: ## {
			if opt_item['pre'] == '+': pattern = '\+'+opt_item['name']+opt_item['suf']; ## need to special process the '+' value
			else: pattern = opt_item['pre']+opt_item['name']+opt_item['suf'];
			pattern = pattern.strip(); ## need to delete all blanks.
			self.__debug_info__("__opt_match__","matching the option pattern is: "+pattern+", src: "+argv);
			if re.match(pattern,argv): return opt_item['name']; ## if option matched, then return the option name
		## }
		## after looping all, if not returned, then return None to info caller nothing matched.
		return None;

	## end def }


	def __debug_info__(self,func,msg): ## {
		if self.__dbg__: print ("[__DBG__][options::"+func+"] "+msg);
		return;
	## end def }


	def __get_param__(self,opt,argv,argvs): ## {
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
		## __get_sp_param__ is a internal func. to get the parameter value of input option in sp. list.
		sp_param = self.__get_sp_param__(opt);
		if sp_param != None: ## {
			if sp_param == False: return False; ## if current option has no param, then return False directly.
			suf = self.__get_sp_suf(opt);
			if suf == ' ': ## {
				## only if the returned sp_param is not None and suffix is ' ', then it means need
				## to get the next argv as parameter.
				param = argvs.pop(0); ## pop next item from the argvs list.
				if self.__is_opt__(param):  ## {
					print (" ERROR, IOPTF: no available parameter detected for option ("+opt+")."); ## print illegal format exception
					return None;
				## }
				else: return param; ## else the parameter is legal, then to return with parameter
			## }
			else: ## {
				## else if the suffix is not ' ' and in this block, sp_param is also not None, then to check the remained string of this argv
				obj = re.search(suf,argv);
				if obj != None: ## {
					## if the suf matched, then to get remained string
					param = argv[obj.end():].strip();
					if param == '': ## {
						print (" ERROR, IOPTF: no available parameter detected for option ("+opt+")."); ## print illegal format exception
						return None; ## this means if the param info behind the option sufffix is blank info, then need to return NOne and report error
					## }
					else: ## {
						return param; ## else if the param is not '', then return the param.
					## }
				## }
				else: ## {
					## if the suffix not matched for this option, also need to return exception.
					print ("ERROR, IOPTF: no available parameter detected for option ("+opt+").");
					return None;
				## }
			## }
		## }
		else: return None; ## else the sp_param is None, which means no option found in __get_sp_param__
	## end def }

	def __get_sp_param__(self,opt): ## {
		"""
		A func. to return param value in sp. list, the return types are:
		-- None: if the enterred option not exists in sp list.
		-- False: if the option exists, but the param type is False.
		-- string: if the option exists, and the param type is a str.
		"""
		for opt_item in self.__sp_opts__: ## {
			if opt_item['name'] == opt: ## {
				## if the option name matched, then to return the param value
				return opt_item['param'];
			## }
		## }
		## after loop all, if the program still not returned, then to return None, which means the option not exists in __sp_opts__
		return None;
	## end def }

	def __get_sp_suf__(self,opt): ## {
		"""
		Program similiar with __get_sp_param__
		-- None: if enterred option not exists in sp list.
		-- string: if the option exists, and the suf must a str.
		"""
		for opt_item in self.__sp_opts__: ## {
			if opt_item['name'] == opt: ## {
				## if the option name matched, then to return the suffix value
				return opt_item['suf'];
			## }
		## }
		## after looping all, if program still executed here, then it means no item founded in __sp_opts__, should return None.
		return None;
	## end def }

	def __is_opt__(self,val): ## {
		"""
		Func. to check the input value is with '-' or '+' preffixed.
		"""
		if val[0] == '-' or val[0] == '+': return True;
		else: return False;
	## end def }



## }
