#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=FatFS/ff.c FatFS/diskio.c FatFS/ffsystem.c FatFS/ffunicode.c SDCard/device/sd_spi.c SDCard/device/sd_spi_platform_dependencies.c SPI/plib_spi2_master.c SoftSPI.c millis.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FatFS/ff.o ${OBJECTDIR}/FatFS/diskio.o ${OBJECTDIR}/FatFS/ffsystem.o ${OBJECTDIR}/FatFS/ffunicode.o ${OBJECTDIR}/SDCard/device/sd_spi.o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o ${OBJECTDIR}/SPI/plib_spi2_master.o ${OBJECTDIR}/SoftSPI.o ${OBJECTDIR}/millis.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FatFS/ff.o.d ${OBJECTDIR}/FatFS/diskio.o.d ${OBJECTDIR}/FatFS/ffsystem.o.d ${OBJECTDIR}/FatFS/ffunicode.o.d ${OBJECTDIR}/SDCard/device/sd_spi.o.d ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d ${OBJECTDIR}/SPI/plib_spi2_master.o.d ${OBJECTDIR}/SoftSPI.o.d ${OBJECTDIR}/millis.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FatFS/ff.o ${OBJECTDIR}/FatFS/diskio.o ${OBJECTDIR}/FatFS/ffsystem.o ${OBJECTDIR}/FatFS/ffunicode.o ${OBJECTDIR}/SDCard/device/sd_spi.o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o ${OBJECTDIR}/SPI/plib_spi2_master.o ${OBJECTDIR}/SoftSPI.o ${OBJECTDIR}/millis.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=FatFS/ff.c FatFS/diskio.c FatFS/ffsystem.c FatFS/ffunicode.c SDCard/device/sd_spi.c SDCard/device/sd_spi_platform_dependencies.c SPI/plib_spi2_master.c SoftSPI.c millis.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FatFS/ff.o: FatFS/ff.c  .generated_files/flags/default/322eae78aed6197bca3c2532ca9867247226a99d .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ff.o.d" -o ${OBJECTDIR}/FatFS/ff.o FatFS/ff.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/diskio.o: FatFS/diskio.c  .generated_files/flags/default/ff968ad6524b1b983699dad4cf27286303ed42a1 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o.d 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/diskio.o.d" -o ${OBJECTDIR}/FatFS/diskio.o FatFS/diskio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffsystem.o: FatFS/ffsystem.c  .generated_files/flags/default/acbe939a60e7bfb9fe68ae05aa67845d2a591ce2 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffsystem.o.d" -o ${OBJECTDIR}/FatFS/ffsystem.o FatFS/ffsystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffunicode.o: FatFS/ffunicode.c  .generated_files/flags/default/2b50fe3f47933a172326cecc381280888e658458 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffunicode.o.d" -o ${OBJECTDIR}/FatFS/ffunicode.o FatFS/ffunicode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi.o: SDCard/device/sd_spi.c  .generated_files/flags/default/9b71ae596ae0b0e883fe52bacc92b5a37c727d1a .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi.o SDCard/device/sd_spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o: SDCard/device/sd_spi_platform_dependencies.c  .generated_files/flags/default/df6ffee3e13207dae6dd475ed2ee3e0a6a18ab67 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o SDCard/device/sd_spi_platform_dependencies.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI/plib_spi2_master.o: SPI/plib_spi2_master.c  .generated_files/flags/default/6b79a0ce308ae12bcd71a7f8d9d49879f86a98c .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SPI" 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SPI/plib_spi2_master.o.d" -o ${OBJECTDIR}/SPI/plib_spi2_master.o SPI/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SoftSPI.o: SoftSPI.c  .generated_files/flags/default/3ecf4bb17a75ec8073de2794d75b7cef7e46edaf .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SoftSPI.o.d 
	@${RM} ${OBJECTDIR}/SoftSPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SoftSPI.o.d" -o ${OBJECTDIR}/SoftSPI.o SoftSPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/526d44486586cf076f25128d95e027c665456590 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/millis.o.d" -o ${OBJECTDIR}/millis.o millis.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/8d59be5219f37eb111a821b866c0d8355e9398e7 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FatFS/ff.o: FatFS/ff.c  .generated_files/flags/default/78d085ae913bbc2db2d00ce250a5cd56b3e1cf65 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ff.o.d" -o ${OBJECTDIR}/FatFS/ff.o FatFS/ff.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/diskio.o: FatFS/diskio.c  .generated_files/flags/default/65ad8ee9b01ec8d685419dbef989611ed60aeaef .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o.d 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/diskio.o.d" -o ${OBJECTDIR}/FatFS/diskio.o FatFS/diskio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffsystem.o: FatFS/ffsystem.c  .generated_files/flags/default/ffb73ad79b2e2eb57a20788d21c9391bdd8c58f4 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffsystem.o.d" -o ${OBJECTDIR}/FatFS/ffsystem.o FatFS/ffsystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffunicode.o: FatFS/ffunicode.c  .generated_files/flags/default/1a38eeb99dc9f53fcc3249c7adae01c2027917d8 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffunicode.o.d" -o ${OBJECTDIR}/FatFS/ffunicode.o FatFS/ffunicode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi.o: SDCard/device/sd_spi.c  .generated_files/flags/default/5cd4acbb79953f9fd1f4a53009f30b9be981afa .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi.o SDCard/device/sd_spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o: SDCard/device/sd_spi_platform_dependencies.c  .generated_files/flags/default/87bb561746ca46a953e00114812626b9cae502ac .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o SDCard/device/sd_spi_platform_dependencies.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI/plib_spi2_master.o: SPI/plib_spi2_master.c  .generated_files/flags/default/2993021c7823a8c1d883bce2a2078c08e1ec0780 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SPI" 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SPI/plib_spi2_master.o.d" -o ${OBJECTDIR}/SPI/plib_spi2_master.o SPI/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SoftSPI.o: SoftSPI.c  .generated_files/flags/default/57061084dbb799b6897ab0df604189f9006f3346 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SoftSPI.o.d 
	@${RM} ${OBJECTDIR}/SoftSPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SoftSPI.o.d" -o ${OBJECTDIR}/SoftSPI.o SoftSPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/7da50fe90baf69a8952d802f0244735779171913 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/millis.o.d" -o ${OBJECTDIR}/millis.o millis.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/1c01b507f9c33eba96966d89d3e1cf6cd13458cd .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=2048,--defsym=_min_stack_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=2048,--defsym=_min_stack_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/SoundChipDataprovider.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
