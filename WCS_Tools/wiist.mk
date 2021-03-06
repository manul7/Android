################################################################################
#
# wiist.mk
#
# Makefile for Android project integrated with NLCP
#
# Android Version	:	L27.INC1.13.1 OMAP4 GingerBread ES2
# Platform	     	:	Blaze platform es2.2
# Date				:	July 2011
#
# Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and  
# limitations under the License.
#
################################################################################

include defs.mk

###############################################################################
# ti-st
###############################################################################

.PHONY += ti-st-test-config
.PHONY += ti-st-err-bringup
.PHONY += ti-st-err-config
.PHONY += ti-st-pre-bringup-validation

ti-st-test-config:
ifeq ($(CONFIG_TIST), y)
	@if [ ! -f $(PROGRESS_BRINGUP_TIST) ] ; then $(MAKE) ti-st-err-bringup ; fi
else
	@if [ -f $(PROGRESS_BRINGUP_TIST) ] ; then $(MAKE) ti-st-err-config ; fi
endif

ti-st-err-bringup:
	$(error "ti-st configured, but bringup was not performed")
	
ti-st-err-config:
	$(error "ti-st not configured, but bringup was performed")
	
$(PROGRESS_BRINGUP_TIST):
ifeq ($(CONFIG_TIST), y)
	@$(MAKE) ti-st-bringup-private
	@$(call echo-to-file, "INCLUDED", $(PROGRESS_BRINGUP_TIST))
	@$(call print, "ti-st bringup done")
else
	@$(call print, "ti-st bringup excluded")
endif

ti-st-pre-bringup-validation:
ifeq ($(CONFIG_TIST), y)
	@$(MAKE) ti-st-private-pre-bringup-validation
endif

ti-st-bringup: ti-st-pre-bringup-validation
	@$(MAKE) $(PROGRESS_BRINGUP_TIST)

ti-st-make: $(PROGRESS_BRINGUP_TIST)
	@$(MAKE) ti-st-test-config
ifeq ($(CONFIG_TIST), y)
	@$(MAKE) ti-st-make-private
	@$(call print, "ti-st make done")
else
	@$(call print, "ti-st make excluded")
endif

ti-st-install: $(PROGRESS_BRINGUP_TIST)
	@$(MAKE) ti-st-test-config
ifeq ($(CONFIG_TIST), y)
	@$(MAKE) ti-st-install-private
	@$(call print, "ti-st install done")
else
	@$(call print, "ti-st install excluded")
endif

ti-st-clean: $(PROGRESS_BRINGUP_TIST)
	@$(MAKE) ti-st-test-config
ifeq ($(CONFIG_TIST), y)
	@$(MAKE) ti-st-clean-private
	@$(call print, "ti-st clean done")
else
	@$(call print, "ti-st clean excluded")
endif

###############################################################################
# fm
###############################################################################

.PHONY += fm-test-config
.PHONY += fm-err-bringup
.PHONY += fm-err-config
.PHONY += fm-pre-bringup-validation

fm-test-config:
ifeq ($(CONFIG_FM), y)
	@if [ ! -f $(PROGRESS_BRINGUP_FM) ] ; then $(MAKE) fm-err-bringup ; fi
else
	@if [ -f $(PROGRESS_BRINGUP_FM) ] ; then $(MAKE) fm-err-config ; fi
endif

fm-err-bringup:
	$(error "fm configured, but bringup was not performed")
	
fm-err-config:
	$(error "fm not configured, but bringup was performed")
	
$(PROGRESS_BRINGUP_FM):
ifeq ($(CONFIG_FM), y)
	@$(MAKE) fm-bringup-private
	@$(call echo-to-file, "INCLUDED", $(PROGRESS_BRINGUP_FM))
	@$(call print, "fm bringup done")
else
	@$(call print, "fm bringup excluded")
endif

fm-pre-bringup-validation:
ifeq ($(CONFIG_FM), y)
	@$(MAKE) fm-private-pre-bringup-validation
endif

fm-bringup: fm-pre-bringup-validation
	@$(MAKE) $(PROGRESS_BRINGUP_FM)

fm-make: $(PROGRESS_BRINGUP_FM)
	@$(MAKE) fm-test-config
ifeq ($(CONFIG_FM), y)
	@$(MAKE) fm-make-private
	@$(call print, "fm make done")
else
	@$(call print, "fm make excluded")
endif

fm-install: $(PROGRESS_BRINGUP_FM)
	@$(MAKE) fm-test-config
ifeq ($(CONFIG_FM), y)
	@$(MAKE) fm-install-private
	@$(call print, "fm install done")
else
	@$(call print, "fm install excluded")
endif

fm-clean: $(PROGRESS_BRINGUP_FM)
	@$(MAKE) fm-test-config
ifeq ($(CONFIG_FM), y)
	@$(MAKE) fm-clean-private
	@$(call print, "fm clean done")
else
	@$(call print, "fm clean excluded")
endif

###############################################################################
# gps
###############################################################################

.PHONY += gps-test-config
.PHONY += gps-err-bringup
.PHONY += gps-err-config
.PHONY += gps-pre-bringup-validation

gps-test-config:
ifeq ($(CONFIG_GPS), y)
	@if [ ! -f $(PROGRESS_BRINGUP_GPS) ] ; then $(MAKE) gps-err-bringup ; fi
else
	@if [ -f $(PROGRESS_BRINGUP_GPS) ] ; then $(MAKE) gps-err-config ; fi
endif

gps-err-bringup:
	$(error "gps configured, but bringup was not performed")
	
gps-err-config:
	$(error "gps not configured, but bringup was performed")
	
$(PROGRESS_BRINGUP_GPS):
ifeq ($(CONFIG_GPS), y)
	@$(MAKE) gps-bringup-private
	@$(call echo-to-file, "INCLUDED", $(PROGRESS_BRINGUP_GPS))
	@$(call print, "gps bringup done")
else
	@$(call print, "gps bringup excluded")
endif

gps-pre-bringup-validation:
ifeq ($(CONFIG_GPS), y)
	@$(MAKE) gps-private-pre-bringup-validation
endif

gps-bringup: gps-pre-bringup-validation
	@$(MAKE) $(PROGRESS_BRINGUP_GPS)

gps-make: $(PROGRESS_BRINGUP_GPS)
	@$(MAKE) gps-test-config
ifeq ($(CONFIG_GPS), y)
	@$(MAKE) gps-make-private
	@$(call print, "gps make done")
else
	@$(call print, "gps make excluded")
endif

gps-install: $(PROGRESS_BRINGUP_GPS)
	@$(MAKE) gps-test-config
ifeq ($(CONFIG_GPS), y)
	@$(MAKE) gps-install-private
	@$(call print, "gps install done")
else
	@$(call print, "gps install excluded")
endif

gps-clean: $(PROGRESS_BRINGUP_GPS)
	@$(MAKE) gps-test-config
ifeq ($(CONFIG_GPS), y)
	@$(MAKE) gps-clean-private
	@$(call print, "gps clean done")
else
	@$(call print, "gps clean excluded")
endif

###############################################################################
# bt
###############################################################################

.PHONY += bt-test-config
.PHONY += bt-err-bringup
.PHONY += bt-err-config
.PHONY += bt-pre-bringup-validation

bt-test-config:
ifeq ($(CONFIG_BT), y)
	@if [ ! -f $(PROGRESS_BRINGUP_BT) ] ; then $(MAKE) bt-err-bringup ; fi
else
	@if [ -f $(PROGRESS_BRINGUP_BT) ] ; then $(MAKE) bt-err-config ; fi
endif

bt-err-bringup:
	$(error "bt configured, but bringup was not performed")
	
bt-err-config:
	$(error "bt not configured, but bringup was performed")
	
$(PROGRESS_BRINGUP_BT):
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-bringup-private
	@$(call echo-to-file, "INCLUDED", $(PROGRESS_BRINGUP_BT))
	@$(call print, "bt bringup done")
else
	@$(call print, "bt bringup excluded")
endif

bt-pre-bringup-validation:
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-private-pre-bringup-validation
endif

bt-bringup: bt-pre-bringup-validation
	@$(MAKE) $(PROGRESS_BRINGUP_BT)

bt-make: $(PROGRESS_BRINGUP_BT)
	@$(MAKE) bt-test-config
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-make-private
	@$(call print, "bt make done")
else
	@$(call print, "bt make excluded")
endif

bt-install: $(PROGRESS_BRINGUP_BT)
	@$(MAKE) bt-test-config
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-install-private
	@$(call print, "bt install done")
else
	@$(call print, "bt install excluded")
endif

bt-clean: $(PROGRESS_BRINGUP_BT)
	@$(MAKE) bt-test-config
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-clean-private
	@$(call print, "bt clean done")
else
	@$(call print, "bt clean excluded")
endif

bt-distclean:
	@$(MAKE) bt-test-config
ifeq ($(CONFIG_BT), y)
	@$(MAKE) bt-distclean-private
	@if [ -f $(PROGRESS_BRINGUP_BT) ] ; then $(DEL) $(PROGRESS_BRINGUP_BT) ; fi
	@$(call print, "bt distclean done")
else
	@$(call print, "bt distclean excluded")
endif

###############################################################################
# nlcp
###############################################################################

.PHONY += nlcp-test-config
.PHONY += nlcp-err-bringup
.PHONY += nlcp-err-config
.PHONY += nlcp-pre-bringup-validation

nlcp-test-config:
ifeq ($(CONFIG_NLCP), y)
	@if [ ! -f $(PROGRESS_BRINGUP_NLCP) ] ; then $(MAKE) nlcp-err-bringup ; fi
else
	@if [ -f $(PROGRESS_BRINGUP_NLCP) ] ; then $(MAKE) nlcp-err-config ; fi
endif

nlcp-err-bringup:
	$(error "nlcp configured, but bringup was not performed")
	
nlcp-err-config:
	$(error "nlcp not configured, but bringup was performed")
	
$(PROGRESS_BRINGUP_NLCP):
ifeq ($(CONFIG_NLCP), y)
	@$(MAKE) nlcp-bringup-private
	@$(call echo-to-file, "INCLUDED", $(PROGRESS_BRINGUP_NLCP))
	@$(call print, "nlcp bringup done")
else
	@$(call print, "nlcp bringup excluded")
endif

nlcp-pre-bringup-validation:
ifeq ($(CONFIG_NLCP), y)
	@$(MAKE) nlcp-private-pre-bringup-validation
endif

nlcp-bringup: nlcp-pre-bringup-validation
	@$(MAKE) $(PROGRESS_BRINGUP_NLCP)

nlcp-make: $(PROGRESS_BRINGUP_NLCP)
	@$(MAKE) nlcp-test-config
ifeq ($(CONFIG_NLCP), y)
	@$(MAKE) nlcp-private-pre-make-validation
	@$(MAKE) nlcp-make-private
	@$(call print, "nlcp make done")
else
	@$(call print, "nlcp make excluded")
endif

nlcp-install: $(PROGRESS_BRINGUP_NLCP)
	@$(MAKE) nlcp-test-config
ifeq ($(CONFIG_NLCP), y)
	@$(MAKE) nlcp-install-private
	@$(call print, "nlcp install done")
else
	@$(call print, "nlcp install excluded")
endif

nlcp-clean: $(PROGRESS_BRINGUP_NLCP)
	@$(MAKE) nlcp-test-config
ifeq ($(CONFIG_NLCP), y)
	@$(MAKE) nlcp-clean-private
	@$(call print, "nlcp clean done")
else
	@$(call print, "nlcp clean excluded")
endif

nlcp-distclean:
	@$(MAKE) bt-test-config
ifeq ($(CONFIG_BT), y)
	@$(MAKE) nlcp-distclean-private
	@if [ -f $(PROGRESS_BRINGUP_NLCP) ] ; then $(DEL) $(PROGRESS_BRINGUP_NLCP) ; fi
	@$(call print, "nlcp distclean done")
else
	@$(call print, "nlcp distclean excluded")
endif
