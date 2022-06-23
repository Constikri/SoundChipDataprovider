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
FINAL_IMAGE=${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/FatFS/ff.o: FatFS/ff.c  .generated_files/flags/default/7d9ea0090fc3f60f4237a7eb05e1a24d6ca9ec15 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ff.o.d" -o ${OBJECTDIR}/FatFS/ff.o FatFS/ff.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/diskio.o: FatFS/diskio.c  .generated_files/flags/default/ab1cf2ca01913552cd7d52ea5bd9b20afba4a048 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o.d 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/diskio.o.d" -o ${OBJECTDIR}/FatFS/diskio.o FatFS/diskio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffsystem.o: FatFS/ffsystem.c  .generated_files/flags/default/3edce4cf91d73c2fd1f0bf0d0d902a6ad15b3fec .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffsystem.o.d" -o ${OBJECTDIR}/FatFS/ffsystem.o FatFS/ffsystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffunicode.o: FatFS/ffunicode.c  .generated_files/flags/default/8e5fc286f119747986cc06100038fd847454a41f .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffunicode.o.d" -o ${OBJECTDIR}/FatFS/ffunicode.o FatFS/ffunicode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi.o: SDCard/device/sd_spi.c  .generated_files/flags/default/e58c514a5870487fb4eb61dcdec06d6c5d344b81 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi.o SDCard/device/sd_spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o: SDCard/device/sd_spi_platform_dependencies.c  .generated_files/flags/default/1e2b902b2a0302f4b043f7d382fcf5c25b643a41 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o SDCard/device/sd_spi_platform_dependencies.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI/plib_spi2_master.o: SPI/plib_spi2_master.c  .generated_files/flags/default/3cda19853cbef3e8ed52fd53fb9d4e33fa3d786a .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SPI" 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SPI/plib_spi2_master.o.d" -o ${OBJECTDIR}/SPI/plib_spi2_master.o SPI/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SoftSPI.o: SoftSPI.c  .generated_files/flags/default/d34b44123c3e102578637277b1b4e683af7b6449 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SoftSPI.o.d 
	@${RM} ${OBJECTDIR}/SoftSPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SoftSPI.o.d" -o ${OBJECTDIR}/SoftSPI.o SoftSPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/a4f6652c0e66695ef91dba54e6b94233453c9e53 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/millis.o.d" -o ${OBJECTDIR}/millis.o millis.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/c863d76c22bf3d29fa30aafcb662e6b95dd26ee6 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FatFS/ff.o: FatFS/ff.c  .generated_files/flags/default/5fae3e18b3a0782e2411c3ad0b32acfa7faf72c1 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ff.o.d" -o ${OBJECTDIR}/FatFS/ff.o FatFS/ff.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/diskio.o: FatFS/diskio.c  .generated_files/flags/default/814ac0c784229ed8ee3a11f8a5ec493b91856fc6 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o.d 
	@${RM} ${OBJECTDIR}/FatFS/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/diskio.o.d" -o ${OBJECTDIR}/FatFS/diskio.o FatFS/diskio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffsystem.o: FatFS/ffsystem.c  .generated_files/flags/default/8b6b4fecd34bf552c94f58aecf59c06dd60a7ba5 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffsystem.o.d" -o ${OBJECTDIR}/FatFS/ffsystem.o FatFS/ffsystem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFS/ffunicode.o: FatFS/ffunicode.c  .generated_files/flags/default/6ee7cb315f32c156faba18e766d1b8f4d492bee1 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/FatFS" 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFS/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/FatFS/ffunicode.o.d" -o ${OBJECTDIR}/FatFS/ffunicode.o FatFS/ffunicode.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi.o: SDCard/device/sd_spi.c  .generated_files/flags/default/3d88f684503ebf1289e36d0e70fe3dcd1a9325b2 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi.o SDCard/device/sd_spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o: SDCard/device/sd_spi_platform_dependencies.c  .generated_files/flags/default/ca3fb2a6b023b6177d9f856c732bf29ebb80dfb1 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SDCard/device" 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d 
	@${RM} ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o.d" -o ${OBJECTDIR}/SDCard/device/sd_spi_platform_dependencies.o SDCard/device/sd_spi_platform_dependencies.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI/plib_spi2_master.o: SPI/plib_spi2_master.c  .generated_files/flags/default/5406305bb0366460ff9e692ae957eab95016b179 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}/SPI" 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o.d 
	@${RM} ${OBJECTDIR}/SPI/plib_spi2_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SPI/plib_spi2_master.o.d" -o ${OBJECTDIR}/SPI/plib_spi2_master.o SPI/plib_spi2_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SoftSPI.o: SoftSPI.c  .generated_files/flags/default/f028c521b06deb010bc82f13e5888f4f67418528 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SoftSPI.o.d 
	@${RM} ${OBJECTDIR}/SoftSPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/SoftSPI.o.d" -o ${OBJECTDIR}/SoftSPI.o SoftSPI.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/millis.o: millis.c  .generated_files/flags/default/458cf2895330484d5c6fb79c485773e8f709cd00 .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/millis.o.d 
	@${RM} ${OBJECTDIR}/millis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/millis.o.d" -o ${OBJECTDIR}/millis.o millis.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/f65dcac2970aa1d04db1615acdb379003d3474de .generated_files/flags/default/af031a62ccc0c18b099f063c5edfd8e7f9b606f2
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
${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=2048,--defsym=_min_stack_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=2048,--defsym=_min_stack_size=2048,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/Soundchip_DataProvider.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
