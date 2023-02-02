/*-----------------------------------------------------------------------*/
/* Low level disk I/O module SKELETON for FatFs     (C)ChaN, 2019        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control modules to the FatFs module with a defined API.       */
/*-----------------------------------------------------------------------*/

#include "ff.h"			/* Obtains integer types */
#include "diskio.h"		/* Declarations of disk functions */
#include "../SDCard/sd_spi.h"

/* Definitions of physical drive number for each drive */
#define DEV_RAM		0	/* Example: Map Ramdisk to physical drive 0 */
#define DEV_MMC		1	/* Example: Map MMC/SD card to physical drive 1 */
#define DEV_USB		2	/* Example: Map USB MSD to physical drive 2 */

/*-----------------------------------------------------------------------*/
/* Helper Functions                                                     */
/*-----------------------------------------------------------------------*/

DRESULT convert_result(int result)
{
    switch(result){
        case SD_ERR_OK:
            return RES_OK;
        case SD_ERR_WRITE_FAILURE:
        case SD_ERR_WRITE_TIMEOUT:
        case SD_ERR_WRITE_OUTSIDE_OF_BLOCK:
        case SD_ERR_WRITE_DATA_REJECTED:
        case SD_ERR_WRITE_DATA_CRC_REJECTED:
        case SD_ERR_WRITE_PRE_ERASE:
        case SD_ERR_READ_FAILURE:
        case SD_ERR_READ_TIMEOUT:
        case SD_ERR_READ_OUTSIDE_OF_BLOCK:
            return RES_ERROR;
        case SD_ERR_WRITE_PROTECTION_VIOLATION:
            return RES_WRPRT;
        case SD_ERR_ILLEGAL_PARAMETER:
            return RES_PARERR;
        case SD_ERR_NOT_INITIALIZED:
            return RES_NOTRDY;
        default:
            return result;
    }
}

/*-----------------------------------------------------------------------*/
/* Get Drive Status                                                      */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE pdrv		/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat;
	int result;
    
    result = sd_spi_card_status();
    
    stat = (DSTATUS)result;
    
	return stat;
}



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE pdrv				/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat;
	int result;

	result = sd_spi_init(0x2000); //init with drive number ~ chip select pin in this case
    
    stat = (DSTATUS)result;
    return stat;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber to identify the drive */
	BYTE *buff,		/* Data buffer to store read data */
	LBA_t sector,	/* Start sector in LBA */
	UINT count		/* Number of sectors to read */
)
{
	DRESULT res;
	int result;

	result = sd_spi_read(sector, buff, count*512, 0);
    
    res = convert_result(result);
    
    return res;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if FF_FS_READONLY == 0

DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber to identify the drive */
	const BYTE *buff,	/* Data to be written */
	LBA_t sector,		/* Start sector in LBA */
	UINT count			/* Number of sectors to write */
)
{
	DRESULT res;
	int result;

	result = sd_spi_write_block(sector, buff);
    if(result != SD_ERR_OK){
        res = convert_result(result);
        return res;
    }
    result = sd_spi_flush();
    
    res = convert_result(result);
    
    return res;
}

#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT res;
	int result;

	switch (pdrv) {
	case DEV_RAM :

		// Process of the command for the RAM drive

		return res;

	case DEV_MMC :

		// Process of the command for the MMC/SD card

		return res;

	case DEV_USB :

		// Process of the command the USB drive

		return res;
	}

	return RES_PARERR;
}

