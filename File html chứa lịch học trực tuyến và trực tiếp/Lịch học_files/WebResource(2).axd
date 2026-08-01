/* RadScheduler base stylesheet */

/* <common> */

.RadScheduler,
.RadScheduler a,
.RadScheduler input,
.RadScheduler select,
.RadScheduler textarea
{
	outline: 0;
}

.RadScheduler
{
	cursor: default;
	overflow: hidden;
	text-align: left;
	zoom: 1;
}

.RadScheduler .rsTopWrap
{
	position: relative;
	border: 0;
	width: 100%; /*Fix for IE6/7 0px width in a table when refreshed*/
	overflow: hidden;
}

.RadScheduler .rsAdvFormWrap
{
	position: relative;
}

* html div.RadScheduler .rsAdvFormWrap { position: static; }

.RadScheduler,
.RadScheduler *
{
	margin: 0;
	padding: 0;
}

* html .RadScheduler .rsContent .rsInnerFix,
* html .RadScheduler .rsContent td
{
    zoom: 1;
}

.RadScheduler .rsContentTable,
.RadScheduler .rsAllDayTable
{
	overflow: hidden;
}

/* </common> */

/* <header> */

.RadScheduler .rsHeader
{
	height: 30px;
	line-height: 30px;
	z-index: 1000;
	position: relative;
	background-color: transparent;
	background-position: 0 0;
	background-repeat: repeat-x;
}

.RadScheduler .rsHeader p
{
	padding-left: 5px;
	float: left;
}

.RadScheduler .rsHeader .rsDatePickerWrapper
{
	float: left;
	position: relative;
	top: 23px;
	left: -7px;
	overflow: hidden;
}

.RadScheduler .rsHeader .rsPrevDay,
.RadScheduler .rsHeader .rsNextDay
{
	width: 17px;
	height: 17px;
	line-height: 17px;
	
	display: block;
	text-indent: -9999px;
	font-size: 0;
	float: left;
}

.RadScheduler .rsHeader .rsPrevDay
{
	margin: 6px 0 0 6px;
	background-position: 0 -48px;
}

.RadScheduler .rsHeader .rsNextDay
{
	margin: 6px 6px 0 0;
	background-position: -18px -48px;
}

.RadScheduler .rsHeader .rsPrevDay:hover
{
	background-position: -70px -48px;
}

.RadScheduler .rsHeader .rsNextDay:hover
{
	background-position: -88px -48px;
}

.RadScheduler .rsHeader .rsToday
{
	line-height: 30px;
}

.RadScheduler .rsHeader .rsDatePickerActivator
{
	margin: 3px 0 0 5px;
	width: 21px;
	height: 24px;
	line-height: 21px;
	float: left;
	font-size: 0;
	overflow: hidden;
	text-indent: -9999px;
	background-position: -228px -31px;
}

.RadScheduler .rsHeader .rsDatePickerActivator:hover
{
	background-position: -270px -31px;
}

.RadScheduler .rsHeader .rsDatePickerActivatorDown,
.RadScheduler .rsHeader .rsDatePickerActivatorDown:hover
{
	background-position: -249px -31px;
}

.RadScheduler .rsHeader .rsDatePickerCalendar
{
	position: absolute;
}

.RadScheduler .rsHeader h2
{
	font-size: 15px;
	font-weight: normal;
	text-indent: 43px;
	height: 30px;
	display: block;
	overflow: hidden;
}

.RadScheduler .rsHeader ul
{
	float: right;
	padding-right: 10px;
}

.RadScheduler .rsHeader li
{
	line-height: 30px;
	margin-top: 0;
	list-style-type: none;
	float: left;
}

.RadScheduler .rsTopWrap .rsHeader ul a
{
	text-decoration: none;
	display: block;
	padding-left: 9px;
	line-height: 30px;
}

.RadScheduler .rsHeader ul span,
.RadScheduler .rsHeader ul em
{
	text-decoration: none;
	display: block;
	padding: 0 9px 0 0;
	font-style: normal;
}

.RadScheduler .rsHeader .rsSelected { padding-left: 9px; background-position: 0 -69px; }
.RadScheduler .rsHeader .rsSelected em { padding-top: 0; background-position: 100% -69px; }
	
.RadScheduler .rsHeader ul a:hover,
.RadScheduler .rsLast a:hover { background-position: 0 -69px; }
.RadScheduler .rsHeader ul a:hover span { background-position: 100% -69px; }

/* </header> */

/* <content> */

/*     <headers> */

.RadScheduler tr
{
	font-size: 12px;
	empty-cells: show;
}

.RadScheduler th,
.RadScheduler td
{
	font-weight: normal;
	vertical-align: top;
	height: auto;
}

.RadScheduler .rsVerticalHeaderWrapper
{
	height: 100%;
	overflow: hidden;
	vertical-align: top;
}

.RadScheduler .rsVerticalHeaderWrapper div
{
	margin-left: 1px;
}

.RadScheduler .rsVerticalHeaderWrapper div div
{
	margin-left: 0;
}

.RadScheduler .rsVerticalHeaderTable div *
{
	padding-right: 4px;
}

.RadScheduler .rsVerticalHeaderTable
{
	height: 100%;
	width: 100%;
}

.RadScheduler .rsVerticalHeaderTable th
{
	border-style: solid;
	border-width: 0 1px 1px 0;
}
* html .RadScheduler .rsVerticalHeaderTable th { border-bottom: 0; text-align: right; }
* html .RadScheduler .rsVerticalHeaderTable .rsMainHeader th,
* html .RadScheduler .rsVerticalHeaderTable .rsAlt th { border-bottom: 1px solid; }

.RadScheduler .rsVerticalHeaderTable .rsAlt th
{
	vertical-align: bottom;
}

.RadScheduler .rsTopWrap .rsHidden
{
	display: none;
}

.RadScheduler .rsTopWrap .rsHidden,
.RadScheduler .rsTopWrap .rsHidden th
{
	overflow: hidden;
	border-style: none;
	line-height: 0;
	font-size: 0;
	height: 0;
}

.RadScheduler .rsVerticalHeaderTable div
{
	white-space: nowrap; /* think about removing the nowrap!!! */
	overflow: hidden;	
	height: 100%;
	font-weight: bold;
	text-align: right;
}

.RadScheduler .rsSpacerCell,
.RadScheduler .rsHorizontalHeaderTable th,
.RadScheduler .rsVerticalHeaderTable div,
.RadScheduler .rsAllDayHeader,
.RadScheduler .rsAllDayTable
{
	line-height: 13px;
}

*|html .RadScheduler .rsSpacerCell,
.RadScheduler .rsHorizontalHeaderTable th,
.RadScheduler .rsVerticalHeaderTable div,
.RadScheduler .rsAllDayHeader,
.RadScheduler .rsAllDayTable
{
	line-height: 14px;
}

.RadScheduler .rsHorizontalHeaderWrapper
{
	overflow: hidden;
}

.RadScheduler .rsHorizontalHeaderTable,
.RadScheduler .rsAllDayTable
{
	table-layout: fixed;
}

.RadScheduler .rsSpacerCell,
.RadScheduler .rsHorizontalHeaderTable th
{
	vertical-align: middle;
}

.RadScheduler .rsHorizontalHeaderTable th
{
	background-repeat:  repeat-x;
	background-position: 0 -144px;
	text-align: center;
}

.RadScheduler .rsVerticalHeaderTable .rsMainHeader th
{
	display: block;
}

* html .RadScheduler .rsVerticalHeaderTable .rsMainHeader th
{
	text-align: right;
	overflow: hidden;
	white-space: nowrap;
}

.RadScheduler .rsSpacerCell,
.RadScheduler .rsVerticalHeaderTable th,
.RadScheduler .rsHorizontalHeaderTable th
{
	border-width: 0 1px 1px 0;
	border-style: solid;
	overflow: hidden;
}

.RadScheduler .rsAllDayRow td,
.RadScheduler .rsContentTable td
{
	border-width: 0 1px 1px 0;
	border-style: solid;
}

.RadScheduler .rsSpacerCell,
.RadScheduler .rsContent .rsAllDayHeader
{
	text-align: center;
}

.RadScheduler .rsVerticalHeaderTable th
{
	text-align: right;
}

.RadScheduler .rsTopWrap .rsLastCell
{
	border-right-width: 0;
}

.RadScheduler .rsAmPm
{
	font-size: 10px;
	font-weight: normal;
	line-height: 10px;
	text-transform: lowercase;
	position: relative;
	top: -4px;
	padding: 0 1px;
}

* html .RadScheduler .rsAmPm
{
	position: static;
	padding-bottom: 4px;
	display: inline-block;
}

*+html .RadScheduler .rsAmPm
{
	position: static;
	padding-bottom: 4px;
	display: inline-block;
}

.RadScheduler .rsAllDayHeader
{
	border-width: 0 1px 1px 0;
	border-style: solid;
}

.RadScheduler .rsDateHeader
{
	padding: 1px 4px 3px;
	text-decoration: none;
	font-size: 13px;
}

.RadScheduler a.rsDateHeader:hover
{
	text-decoration: underline;
}

.RadScheduler .rsMonthView .rsDateBox
{
	display: block;
	height: 16px;
	white-space: nowrap;
	background-repeat: repeat-x;
	background-position: 0 -299px;
}

.RadScheduler .rsMonthView .rsAptCreate .rsDateBox
{
	background-position: 0 -318px;
}

/*
	IE quirks mode - the height of the headers is incorrect.
	This must be set explicitly to (RowHeight - 1px).
*/
* html .RadScheduler .rsVerticalHeaderTable
{
	table-layout: fixed;
	text-align: right;
}

* html .RadScheduler .rsVerticalHeaderTable tbody div
{
	height: auto;
}

/*     </headers> */

.RadScheduler .rsContentWrapper
{
    vertical-align: top;
	height: 100%;
}

/* nasty ie6-quirks-only-hack */
* html .RadScheduler .rsContent
{
	width /**/: 100%;
}

.RadScheduler .rsContentTable
{
	table-layout: fixed;
}

/*     <appointments> */

.RadScheduler .rsWrap
{
	position: relative;
	width: 100%;
	height: 100%;
}

.RadScheduler .rsApt  /* container */
{
    height:100%;
	overflow: visible;
    position:absolute;
	line-height: 14px;
	font-size: 11px;
}

.RadScheduler .rsAptOut /* bottom-left */
{
	margin-top: 4px;
	margin-right: 4px;
	border: 0;
	padding: 0;
	position: relative;
	height: 100%;
	background-color: transparent;
	background-repeat: no-repeat;
	background-position: 0 100%;
}

.RadScheduler .rsAptMid /* bottom-right */
{
	height: 100%;
	border: 0;
	margin: 0;
	overflow: visible;
	position: relative;
	right: -4px;
	background-color: transparent;
	background-repeat: no-repeat;
	background-position: 100% 100%;
}

.RadScheduler .rsAptIn /* top-right */
{
	height: 100%;
	position: relative;
	margin-top: 0;
	overflow: hidden;
	bottom: 4px;
	overflow: visible;
	background-color: transparent;
	background-repeat: no-repeat;
	background-position: 100% 0;
}

.RadScheduler .rsAptContent /* top-left */
{
	height: 100%;
	padding: 0 0 0 5px;
	margin-left: -4px;
	margin-right: 4px;
	position: relative;
	text-indent: 0;
	overflow: hidden;
	background-color: transparent;
	background-repeat: no-repeat;
	background-position: 0 0;
}
.RadScheduler .rsWArrowLeft .rsAptContent { padding-left: 8px; }
.RadScheduler .rsTimelineView .rsWArrowLeft .rsAptContent { padding-left: 14px; }
.RadScheduler .rsWArrowRight .rsAptContent { padding-right: 12px; }
.RadScheduler .rsTimelineView .rsWArrowRight .rsAptContent { padding-right: 18px; }

.RadScheduler .rsAptContent:before
{
	content: " ";
	clear: both;
	visibility: hidden;
	display: block;
	font-size: 3px;
	line-height: 3px;
	height: 3px;
}

* html .RadScheduler .rsAptContent:first-line { line-height: 19px; } /* IE6 */
*+html .RadScheduler .rsAptContent:first-line { line-height: 18px; } /* IE7 */

* html .RadScheduler .rsAptContent { word-break: break-all; }

.RadScheduler .rsAptSimple .rsAptContent,
.RadScheduler .rsAptSimple .rsAptIn,
.RadScheduler .rsAptSimple .rsAptMid,
.RadScheduler .rsAptSimple .rsAptOut
{
	background-image: none;
	margin: 0;
	bottom: auto;
	right: auto;
}

.RadScheduler .rsAptSimple .rsAptDelete 
{
    right: 2px;
    top: 2px;
}    

.RadScheduler .rsAptSimple .rsAptOut
{
	padding-bottom: 1px;
}

.RadScheduler .rsAptDelete,
.RadScheduler .rsArrowTop,
.RadScheduler .rsArrowBottom,
.RadScheduler .rsArrowLeft,
.RadScheduler .rsArrowRight,
.RadScheduler .rsAptResize
{
	position: absolute;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.RadScheduler .rsAptRecurrence,
.RadScheduler .rsAptRecurrenceException
{
	margin-top: 3px;
	display: inline;
	float: left;
	width: 12px;
	height: 10px;
}
.RadScheduler .rsAptRecurrence { background-position: -1px -348px }
.RadScheduler .rsAptRecurrenceException { background-position: -16px -348px }
* html .RadScheduler .rsAptRecurrence, 
* html .RadScheduler .rsAptRecurrenceException { margin-top: 5px; } /* IE6 */
*+html .RadScheduler .rsAptRecurrence, 
*+html .RadScheduler .rsAptRecurrenceException { margin-top: 5px; } /* IE7 */

@media all and(-webkit-max-device-pixel-ratio: 10000),
   not all and(-webkit-min-device-pixel-ratio: 0) 
{
		.RadScheduler .rsAptRecurrence,
		.RadScheduler .rsAptRecurrenceException { margin-top: 5px; }
		
		.RadScheduler .rsAptContent:first-line { line-height: 18px; }
} /* Opera */

.RadScheduler .rsAptCreate,
.RadScheduler .rsMonthView .rsAptCreate
{
	background-position: 0 -589px;
}

.RadScheduler .rsAptCreateRow2,
.RadScheduler .rsMonthView .rsAptCreateRow2
{
	background-position: 0 -610px;
}

.RadScheduler .rsAptDelete
{
	width: 21px;
	height: 18px;
	outline: 0;
	background-position: -36px -343px;
}

.RadScheduler .rsAptDelete
{
	top: 4px;
	right: 0;
	visibility: hidden;
}

.RadScheduler .rsWArrowRight .rsAptDelete
{
	right: 7px;
}

.RadScheduler .rsArrowTop,
.RadScheduler .rsArrowBottom
{
	width: 100%;
	height: 4px;
}
.RadScheduler .rsArrowTop { background-position: 50% -360px; top: 3px; }
.RadScheduler .rsArrowBottom { background-position: 50% -392px; bottom: 0; }

.RadScheduler .rsAptResize
{
	width: 100%;
	height: 4px;
	cursor: s-resize;
	bottom: 2px; 
	margin-left: -2px; 
	-moz-user-select: none; 
	-webkit-user-select: none; 
	opacity: 0.6;
	-moz-opacity: 0.6;
	filter: alpha(opacity=60);
	background-position: 50% -396px; 
}

.RadScheduler .rsTimelineView .rsAptResize
{
	height: 100%;
	width: 4px;
	cursor: w-resize;
	right: 3px;
	margin-top: -4px;
	background-position:-150px -400px;
}

.RadScheduler .rsArrowLeft,
.RadScheduler .rsArrowRight
{
	height: 7px;
	width: 4px;
	top: 48%; 
}
.RadScheduler .rsArrowLeft { background-position: -132px -374px; left: 2px; }
.RadScheduler .rsArrowRight { background-position: -164px -374px; right: 4px; }
.RadScheduler .rsTimelineView .rsArrowRight { right: 8px; }

/* Four additional appointment resource styles */

.RadScheduler .rsCategoryBlue .rsAptContent,
.RadScheduler .rsCategoryBlue .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryBlue .rsAptMid,
.RadScheduler .rsCategoryBlue .rsAptOut
{
	background-image: url('WebResource.axd?d=zOrfHB4wzpdQIV1ouw3xmGweFg5TQ5o6PKm_NBC0qa97kY5KEPQBRCoMPYLInJsnw3yw8XUwFiCPPdEI9iNCGHLL-DJ6Nq7PQ7-36DueS1JN72OPbrOxhLCZleblbsQaTSUhG7IOo7dos1xpux-JtXQSXMi9qVGL9ijgpQ2&t=634469285920000000');
}

.RadScheduler .rsCategoryRed .rsAptContent,
.RadScheduler .rsCategoryRed .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryRed .rsAptMid,
.RadScheduler .rsCategoryRed .rsAptOut
{
	background-image: url('WebResource.axd?d=a_-KiK2CN5DNKYP7mqtWM6I7q-WvZzDdZzG8sp4aJYBYZjCaRiv7YuFlg_b8-IsKONRs3Ke8nfUdpO_flomsUppa2SRN61sHFGj_dXH5fR2fhyDXrY5btTRErfA7hj1icUstLZatStkWrAfwcBHM8NGvJXCmUls9dg4gww2&t=634469285920000000');
}

.RadScheduler .rsCategoryGreen .rsAptContent,
.RadScheduler .rsCategoryGreen .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryGreen .rsAptMid,
.RadScheduler .rsCategoryGreen .rsAptOut
{
	background-image: url('WebResource.axd?d=M-GWPirgd0u3jGNZ8vLfOV-o8FS5OXJFkvvKtT0GT7AvsbUrlgBTDSB5RzQLk9Akp8T9hQXcwEb3BzFZ8aCpZ1j5RNSRx3FgvNY60ttUorEBGfrjE41PSY2neutXvz3Z3qpPG5a4mwDnms-AJOadEL3AXNrDtFMz2PycHg2&t=634469285920000000');
}

.RadScheduler .rsCategoryOrange .rsAptContent,
.RadScheduler .rsCategoryOrange .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryOrange .rsAptMid,
.RadScheduler .rsCategoryOrange .rsAptOut
{
	background-image: url('WebResource.axd?d=Kc7Aom3jmcMf9rMMLZaiA9oYhFuM2oyClfXUL2eylbNwieFX4EVd7xy-Tcb-9S9IYZ5vIS-dp87orIHDzOTVAxrpdPcJrd3sJvkd3hsSC-Iw7_-ipH3vysysYiXO2Lz2MaZFExTk_XtDCsPaIBADZPp1yx9TrlgQIR24dg2&t=634469285920000000');
}

.RadScheduler .rsCategoryPink .rsAptContent,
.RadScheduler .rsCategoryPink .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryPink .rsAptMid,
.RadScheduler .rsCategoryPink .rsAptOut
{
	background-image: url('WebResource.axd?d=K-l_oMqHoKu9sr0FXJBCyhYhJGAyWDNuf1--7SY_DDEDK1hvawp9D2L1kK5PcSdmJ9R_56pJfGAqc_W8W3OSK4F1K4oVkqKN4kIy9a-57NQauKA1ShmEre4_1RvQyPnJ8N4wCky0qMoeBqr4icxUeCcDv3ZpZlgVzCJqkA2&t=634469285920000000');
}

.RadScheduler .rsCategoryYellow .rsAptContent,
.RadScheduler .rsCategoryYellow .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryYellow .rsAptMid,
.RadScheduler .rsCategoryYellow .rsAptOut
{
	background-image: url('WebResource.axd?d=bnFsLV-AhcQ8omBK31wMHHmPXq2yYPoN9qiqi8QYWf0KqvnFHWruRg5u5SqvX99XjdGD2oQIHsB4OrL5XuxXH0kQVWo9u1RlOpj7Jqk3rkdj0oHqCXD_d1hMnOGY_814hI-K78UOAiwuTZoNCsZhVCLDz6c0hoYm6eMJaA2&t=634469285920000000');
}

.RadScheduler .rsCategoryViolet .rsAptContent,
.RadScheduler .rsCategoryViolet .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryViolet .rsAptMid,
.RadScheduler .rsCategoryViolet .rsAptOut
{
	background-image: url('WebResource.axd?d=2cVWjVL0qRS7HcbEx5PVbLQJRI3b2e1VGvCENwVVigH25QVSarIPJsIitY1BjAaS6Cn5oPbUTcX3qPQbpL60ejDOUR9SeqP2N5LbIakrWHXHQHwGpQliY-q-aGDwastAm-M9UB_YMWNczyAcfRsWRxzwkoB8Co4SF5RNWA2&t=634469285920000000');
}

.RadScheduler .rsCategoryDarkRed .rsAptContent,
.RadScheduler .rsCategoryDarkRed .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryDarkRed .rsAptMid,
.RadScheduler .rsCategoryDarkRed .rsAptOut
{
	background-image: url('WebResource.axd?d=mJvgZLpSEdZ5fTa0k9v8iq6UN0C1gmEkLfcCPrGoJCQDm1ggUi1HzLnduR9aaCKduIGxKE1uIavESmqBVqD9WiXOLmgzfOnqcbX3zJAd5D14LqzrupfzfKqvLCdk5mDFvTl6ZjriXY8BoLdMithogU0mL5z4TO7cME36X6JVzC66eMEU0&t=634469285920000000');
}

.RadScheduler .rsCategoryDarkGreen .rsAptContent,
.RadScheduler .rsCategoryDarkGreen .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryDarkGreen .rsAptMid,
.RadScheduler .rsCategoryDarkGreen .rsAptOut
{
	background-image: url('WebResource.axd?d=ZZQeG1jhecIzPsZHMiKhl9GBCha_I_QSwElGUJn_ytb5Qg-QgsSPEwrAc5UgnMVHmYnghXeupPaxEh7067okgRbN_GSHqebKTRN-0ryyIgsV46ZHHeMbhWw2j0vglWXItQMXfgRAHHqWIEqeLL9eIEqwtGdpeuLw736LaVPJwc43nVuH0&t=634469285920000000');
}

.RadScheduler .rsCategoryDarkBlue .rsAptContent,
.RadScheduler .rsCategoryDarkBlue .rsAptMid .rsAptIn,
.RadScheduler .rsCategoryDarkBlue .rsAptMid,
.RadScheduler .rsCategoryDarkBlue .rsAptOut
{
	background-image: url('WebResource.axd?d=8k84k4AhwgXuZZ2522itSWBENrrZn_wRtd4x291Dc4UT09jiI-jtiThqLbJlNuMY3rZMRGTBLPIGoJWcZuitb17_0UEcAJfnpVM-NZGgeC3Nzmh7sVvWXN5FKDGaqm4q3pdo-kCc8CLFRpao1ECSZ_mhE0Awd9LWIVtHupCwK-J0LeXP0&t=634469285920000000');
}

.RadScheduler .rsCategoryDarkRed .rsAptContent,
.RadScheduler .rsCategoryDarkGreen .rsAptContent,
.RadScheduler .rsCategoryDarkBlue .rsAptContent,
.RadScheduler .rsCategoryViolet .rsAptContent
{
	color: #fff;
}

/*     </appointments> */

/* <month view :: temporary> */

.RadScheduler .rsMonthView .rsWrap
{
	height: 25px;
}

.RadScheduler .rsMonthView .rsApt 
{
    width:100%;
}

.RadScheduler .rsMonthView .rsAptWrap
{
	overflow: hidden;
}

.RadScheduler .rsMonthView .rsAptBottom
{
	margin-top: 25px;
}

.RadScheduler .rsMonthView .rsShowMore
{
	color: #333;
	text-decoration: underline;
	text-align: center;
	cursor: pointer;
}

/* </month view> */

/* <timeline view :: temporary> */

.RadScheduler .rsTimelineView
{
	background: #fff;
}

/* </timeline view> */

/* </content> */

/* <footer> */

.RadScheduler .rsFooter
{
	background-position: 0 -559px;
	border-top-width: 1px;
	border-top-style: solid;
	min-height: 30px;
	height: 30px;
	vertical-align: middle;
}

.RadScheduler .rsFooter .rsFullTime
{
	text-decoration: none;
	padding: 0 0 0 13px;
	margin-left: 5px;
	font-size: 11px;
	line-height: 30px;
	background-position:  0 -252px;
}

.RadScheduler .rsFooter .rsFullTime:hover
{
	text-decoration: underline;
	/*background-position:  0 -275px; */ /* skin-specific! bugged default */
}

/* </footer> */

/* <inline edit form> */

.RadScheduler .rsAptEditFormWrapper,
.RadScheduler .rsAptEditFormOuter
{
	position: relative;
}

.RadScheduler .rsAptEditFormWrapper,
.RadScheduler .rsAptEditFormOuter,
.RadScheduler .rsAptEditFormInner,
.RadScheduler .rsAptEditFormMiddle,
.RadScheduler .rsAptEditFormMiddle2,
.RadScheduler .rsAptEditResizeHandle
{
	background-repeat: no-repeat;
	background-color: transparent;
}

.RadScheduler .rsAptEditFormWrapper .rsAptEditTextareaWrapper
{
	position: relative;
	padding: 3px;
	border-width: 1px;
	border-style: solid;
	margin: -6px -4px 0 -6px;
}

.RadScheduler .rsAptEditFormWrapper textarea
{
	display: block;
	width: 100%;
	height: 100%;
	border: 0;
	outline: 0;
	resize: none;
	overflow: auto;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions
{
	margin: 0 -4px 0 -1px;
	padding: 7px 0 4px;
	overflow: hidden;
	zoom: 1;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions a
{
	width: 73px;
	height: 21px;
	line-height: 21px;
	text-decoration: none;
	display: block;
	margin: 0 5px 0 0;
	float: left;
	text-align: center;
	vertical-align: middle;
	padding: 0;
	bottom: 0;
	cursor: pointer;
	-moz-user-select: none;
	-khtml-user-select: none;
	font-size: 11px;
	position: static;
	background-position: 0 -474px;
	background-repeat: no-repeat;
	background-color: transparent;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions a:hover
{
	background-position: -73px -474px;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions .rsAptEditConfirm
{
	background-position: -146px -474px;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions .rsAptEditConfirm:hover
{
	background-position: -219px -474px;
}

.RadScheduler .rsAptEditFormWrapper .rsEditOptions .rsAptEditMore
{
	margin: 0;
}

.RadScheduler .rsAptEditSizingWrapper
{
	position: absolute;
	width: 100%;
	visibility: hidden;
}

.RadScheduler .rsAptEditSizingWrapper *
{
    _zoom: normal;
}

.RadScheduler .rsAptEditFormOuter { padding: 10px 0 0 0; background-position: 100% 0; }
.RadScheduler .rsAptEditFormInner { padding: 0 0 4px 0; background-position: 0 100%; }
.RadScheduler .rsAptEditFormMiddle { padding: 0 0 0 10px; margin-left: -10px; background-position: 0 100%; }
.RadScheduler .rsAptEditFormMiddle2 { padding:0 8px 0 0; background-position: 100% 100%; }
.RadScheduler .rsAptEditFormWrapper { padding: 0 0 0 10px; background-position: -265px -226px; }

.RadScheduler .rsAptEditResizeHandle
{
	width: 10px;
	height: 10px;
	font-size: 0;
	line-height: 10px;
	position: relative;
	bottom: 6px;
	right: -8px;
	float: right;
	cursor: se-resize;
	background-position: -265px -216px;
}
* html .RadScheduler .rsAptEditResizeHandle { font-family: Arial; font-size: 8px; line-height: 0;  } /* IE6/7 */

/* </inline edit form> */

/* <advanced edit form> */

/*     <common>     */

/* <advanced edit title> */
.RadScheduler .rsAdvancedEdit .rsAdvTitle
{
	height: 30px;
}

.RadScheduler .rsAdvancedEdit .rsAdvInnerTitle
{
	height: 22px;
	font-size: 14px;
	font-weight: normal;
}
* html .RadScheduler .rsAdvancedEdit .rsAdvInnerTitle
{
	height /**/: 30px;
}


.RadScheduler .rsAdvancedEdit .rsAdvTitle
{
	padding: 0 0 0 4px;
	background-color: transparent;
	background-repeat: no-repeat;
}

.RadScheduler .rsAdvancedEdit .rsAdvInnerTitle
{
	background-color: transparent;
	background-position: 100% 0;
	background-repeat: no-repeat;
	padding: 8px 0 0 5px;
}
/* </advanced edit title> */
		
		
.RadScheduler .rsAdvDragCue
{
	border: 2px dashed #444;
	background-color: #aaa;
}

.RadScheduler .rsAdvancedEdit .rsAdvContentWrapper
{
	padding: 10px 10px 0 22px;
}

.RadScheduler .rsAdvancedEdit .rsAdvOptionsScroll
{
	overflow: auto;
	overflow-x: hidden;
	overflow-y: auto;
	padding: 0 10px;
}

.RadScheduler .rsAdvancedEdit .rsAdvOptions
{
	overflow: hidden;
	zoom: 1;
}

.RadScheduler .rsAdvancedEdit ul
{
	zoom: 1;
	list-style: none outside;
}

.RadScheduler .rsAdvancedEdit label 
{
	vertical-align: middle;
	line-height: 23px;
	width: 75px;
	padding: 0 6px 0 0;
	margin: 0;
	display: -moz-inline-block;
	display: inline-block;
	*display: inline;
	zoom: 1;
	text-align: right;
}

.RadScheduler .rsAdvancedEdit table.riTable td
{
	vertical-align: top;
} 

.RadScheduler .rsAdvancedEdit .textareaWrapper,
.RadScheduler .rsAdvancedEdit .rsAdvInput,
.RadScheduler .rsAdvancedEdit select
{
	border-width: 1px;
	border-style: solid;
	vertical-align: middle;
}

.RadScheduler .rsAdvancedEdit .textareaWrapper
{
	padding: 5px;
	resize: none;
	margin: 0 0 11px 81px;
	border-width: 1px;
	border-style: solid;
	zoom: 1;
}

.RadScheduler .rsAdvancedEdit textarea
{
	display: block;
	width: 100%;
	border: 0;
	outline: 0;
	resize: none;
	overflow: auto;
}

.RadScheduler .rsAdvancedEdit .rsAdvInput
{
	padding: 3px 0 2px 1px;
	outline: 0;
	vertical-align: middle;
}

.RadScheduler .rsAdvancedEdit .rfdSelect 
{
	vertical-align: top;
	overflow: visible;
}

.RadScheduler .rsAdvancedEdit .rfdSelect .rfdSelectOuter
{
	float: none;
	height: 18px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns input,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns select,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel input,
.RadScheduler .rsAdvancedEdit .rsAdvMoreControls input
{
	vertical-align: baseline;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrence
{
	position: relative;
}

.RadScheduler .rsAdvancedEdit .rsAdvResetExceptions
{
	position: absolute;
	right: 10px;
	bottom: -25px;
	text-decoration: underline;
}

.RadScheduler .rsValidatorTooltip
{
	position:absolute;
	border: 1px solid #f32800;
	background: #fffdbb;
	color: #f32800;
	white-space: nowrap;
	padding: 2px 4px;
	margin-top: 1px;
}

.RadScheduler .rsAdvancedEdit input.rsInvalid
{
	border-width: 1px;
	border-style: solid;
	background: #fff;
}

.RadScheduler .rsAdvancedEdit .rsInvalid textarea,
.RadScheduler .rsAdvancedEdit .rsInvalid input
{
	background-repeat: no-repeat;
	background-position: 100% -298px;
}

/*     </common>     */

/*     <basic controls>     */

.RadScheduler .rsAdvancedEdit .rsAdvBasicControls li
{
	float: left;
	white-space: nowrap;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel
{
	clear: both;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel li
{
	float: left;
	height: 23px;
	line-height: 23px;
	margin-right: 28px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel .rsTimePick
{
	margin-right: 0;
}

.RadScheduler .rsAdvancedEdit .rsAdvChkWrap 
{
	float: left;
	padding-right: 8px;
}

.RadScheduler .rsAdvancedEdit .rsAdvChkWrap label,
.RadScheduler .rsAdvancedEdit .rsResourceControls .rsCheckBoxList label,
.RadScheduler .rsAdvancedEdit .rsRecurrenceOptionList label,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns label,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel label
{
	width: auto;
	display: inline;
	text-align: left;
	float: none;
}

.RadScheduler .rsAdvancedEdit .rsAdvChkWrap label.rfdCheckboxChecked,
.RadScheduler .rsAdvancedEdit .rsAdvChkWrap label.rfdCheckboxUnchecked
{
	padding-left: 20px; /* override for form-decorated checkboxes */
}

.RadScheduler .rsAdvancedEdit .rsAdvRadio
{
	display: -moz-inline-block;
	display: inline-block;
	*display: inline;
	zoom: 1;
}

.RadScheduler .rsAdvancedEdit .rsAdvRadio label
{
	vertical-align: baseline;
}

.RadScheduler .rsAdvancedEdit .rsAdvChkWrap input,
.RadScheduler .rsAdvancedEdit .rsRecurrenceOptionList input,
.RadScheduler .rsAdvancedEdit .rsAdvRadio input,
.RadScheduler .rsAdvancedEdit .rsAdvWeekly_WeekDays input
{
	display: -moz-inline-block;
	display: inline-block;
	*display: inline;
	zoom: 1;
	vertical-align: middle;
	margin-right: 3px;
}

* html .RadScheduler .rsAdvancedEdit .rsAdvChkWrap input,
* html .RadScheduler .rsAdvancedEdit .rsRecurrenceOptionList input,
* html .RadScheduler .rsAdvancedEdit .rsAdvRadio input,
* html .RadScheduler .rsAdvancedEdit .rsAdvWeekly_WeekDays input
{
	margin: 0;
}

*+html .RadScheduler .rsAdvancedEdit .rsAdvChkWrap input,
*+html .RadScheduler .rsAdvancedEdit .rsRecurrenceOptionList input,
*+html .RadScheduler .rsAdvancedEdit .rsAdvRadio input,
*+html .RadScheduler .rsAdvancedEdit .rsAdvWeekly_WeekDays input
{
	margin: 0;
}

* html .RadScheduler .rsAdvancedEdit .rsAdvDatePicker { margin-right: 5px; }
* html .RadScheduler .rsAdvancedEdit .rsAdvDatePicker .rdfd_ { display: none !important; }

*+html .RadScheduler .rsAdvancedEdit .rsAdvDatePicker { margin-right: 8px; }
*+html .RadScheduler .rsAdvancedEdit .rsAdvDatePicker .rdfd_ { display: none !important; }

.RadScheduler .rsAdvancedEdit .rsAdvDatePicker
{
	zoom: 1;
}

.RadScheduler .rsAdvancedEdit .rsAdvTimePicker
{
	display: inline;
}

.RadScheduler .rsAdvancedEdit .rsAdvBasicControls .rsAdvTimePicker .riTextBox,
.RadScheduler .rsAdvancedEdit .rsAdvDatePicker input
{
	vertical-align: top;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrence
{
	margin-bottom: 9px;
}

/*     </basic controls>     */

/*     <recurrence frequency>     */

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceFreq
{
	float: left;
	width: 118px;
	height: 100px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceFreq label
{
	line-height: 20px;
}
 
.RadScheduler .rsAdvancedEdit .rsAdvPatternPanel
{
	float: left;
	height: 100px;
	width: 400px;
	padding-left: 20px;
	line-height: 23px;
	border-left: 1px solid #dfdfdf;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns p
{
	padding: 4px 0 5px;
}

* html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvHourly .RadInput,
* html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvWeekly .RadInput { vertical-align: middle; }
* html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvYearly .RadInput { margin: -1px 0 0 5px; }

*+html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvHourly .RadInput,
*+html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvWeekly .RadInput { vertical-align: middle; }
*+html .RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvYearly .RadInput { margin: -1px 0 0 5px; }

.RadScheduler .rsAdvancedEdit .rsAdvWeekly_WeekDays li
{
	float: left;
	width: 95px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel
{
	overflow: hidden;
	border: 1px solid #ababab;
	padding: 8px 0 7px 10px;
	zoom: 1;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns
{
	margin: 11px 0 5px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel .rsAdvInput,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .rsAdvInput
{
	width: 26px;
	padding-right: 2px;
}

.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel .RadInput,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .RadInput,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrenceRangePanel .RadComboBox,
.RadScheduler .rsAdvancedEdit .rsAdvRecurrencePatterns .RadComboBox
{
	vertical-align: top;
}

.RadScheduler .rsAdvancedEdit .riUp
{
	margin-top: 2px;
}

.RadScheduler .rsAdvancedEdit .rsAdvDaily li,
.RadScheduler .rsAdvancedEdit .rsAdvMonthly li,
.RadScheduler .rsAdvancedEdit .rsAdvYearly li
{
	line-height: 23px;
	height: 23px;
	margin-bottom: 5px;
}

/*     </recurrence frequency>     */

/*     <resources>     */

.RadScheduler .rsAdvancedEdit .rsAdvResourceLabel,
.RadScheduler .rsAdvancedEdit .rsAdvResourceValue,
.RadScheduler .rsAdvancedEdit .rsCheckBoxList
{
	display: -moz-inline-block;
	display: inline-block;
	*display: inline;
	zoom: 1;
	vertical-align: top;
}

.RadScheduler .rsAdvancedEdit .rsAdvResourceLabel
{
	padding-right: 6px;
}

.RadScheduler .rsAdvancedEdit .rsResourceControls li
{
	clear: left;
}

.RadScheduler .rsAdvancedEdit .rsResourceControls select,
.RadScheduler .rsAdvancedEdit .rsResourceControls input 
{
	width: 140px;
}

/* Override for checkboxes */
.RadScheduler .rsAdvancedEdit .rsResourceControls .rsCheckBoxList input
{
	width: auto;
	margin: 0 4px 0 0;
	vertical-align: middle;
}

/*     </resources>     */

/*     <submit area>     */

.RadScheduler .rsAdvancedEdit .rsAdvancedSubmitArea
{
	text-align: right;
}

.RadScheduler .rsAdvancedEdit .rsAdvButtonWrapper
{
	display: -moz-inline-block;
	display: inline-block;
	zoom: 1;
	*display: inline;
	padding: 10px 0;
}

.RadScheduler .rsAdvancedEdit .rsAdvancedSubmitArea a
{
	text-decoration: none;
	width: 73px;
	height: 21px;
	line-height: 21px;
	display: block;
	float: left;
	text-align: center;
	vertical-align: middle;
	margin-left: 5px;
	background-color: transparent;
	background-repeat: no-repeat; 
	background-position: 0 -474px;
}

.RadScheduler .rsAdvancedEdit .rsAdvancedSubmitArea a,
.RadScheduler .rsAdvancedEdit .rsAdvancedSubmitArea span
{
	display: block;
	float: left;
	cursor: pointer;
}

.RadScheduler .rsAdvancedEdit .rsAdvancedSubmitArea span
{
	float: none;
}

.RadScheduler .rsAdvancedEdit div.rsAdvancedSubmitArea a:hover
{
	background-position: -73px -474px;
}

.RadScheduler .rsAdvancedEdit div.rsAdvancedSubmitArea a.rsAdvEditSave
{
	background-position: -146px -474px;
}

.RadScheduler .rsAdvancedEdit div.rsAdvancedSubmitArea a.rsAdvEditSave:hover
{
	background-position: -219px -474px;
}

/* </submit area> */

/* <date/time picker> */

.RadScheduler .rsDatePickerCalendar .rcRow a
{
	line-height: inherit;
}

.RadScheduler .rsTimePickers
{
	display: -moz-inline-block;
	display: inline-block;
	zoom: 1;
	*display: inline;
	margin: 5px 0;
}

.RadScheduler .rsTimePick
{
	width: 244px;
}

.RadScheduler .rsTimePick .RadPicker
{
	display: -moz-inline-block;
	display: inline-block;
	*display: inline;
}

* html .RadScheduler .rsTimePick .RadPicker { zoom: 1; }

.RadScheduler .rsAttributeControls li,
.RadScheduler .rsResourceControls li
{
	padding-bottom: 5px;
}
.RadScheduler .rsAttributeControls li li,
.RadScheduler .rsResourceControls li li
{
	padding-bottom: 0;
}

.RadScheduler .rsAllDayWrapper
{
	float: right;
	margin-left: 25px;
}

.RadScheduler .rsTimePick input.riEnabled,
.RadScheduler .rsTimePick input.riHover,
.RadScheduler .rsTimePick input.riFocused
{
	background-repeat: no-repeat;
	background-position: 100% -254px;
}

/* </date/time picker> */

* html .RadScheduler .rsAdvRecurrenceDropDown { margin-right: 5px; }
*+html .RadScheduler .rsAdvRecurrenceDropDown { margin-right: 5px; }

/* </advanced edit form> */

/* <modal dialogs> */

.RadScheduler .rsModalWrapper,
.RadScheduler .rsOverlay
{
	position: absolute;
	top: 0;
	left: 0;
}

.RadScheduler .rsModalWrapper
{
	z-index: 5000;
}

.RadScheduler .rsModalWrapper .rsOverlay
{
	background: #000;
}

.RadScheduler .rsModalWrapper .rsModalDialog
{
	position: absolute;
	overflow: hidden;
	border: 0;
	background: transparent;
}

.RadScheduler .rsModalWrapper .rsModalOuter
{
	border-width: 0 0 1px 0;
	border-style: solid;
	padding: 4px 4px 0 4px;
	background-color: transparent;
	background-repeat: no-repeat;
}

.RadScheduler .rsModalWrapper .rsModalOuterTitle
{
	background-color: transparent;
	background-position: 100% 0;
	background-repeat: no-repeat;
	padding: 28px 4px 4px 0;
	margin: -4px -4px 0 0;
}

.RadScheduler .rsModalWrapper .rsModalInner
{
	border-width: 1px;
	border-style: solid;
}

.RadScheduler .rsModalWrapper .rsModalWindowClose,
.RadScheduler .rsAdvEditClose
{
	background-color: transparent;
	background-position: -38px -526px;
	background-repeat: no-repeat;
	display: block;
	width: 28px;
	height: 16px;
	float: right;
	margin-top: -22px;
	padding: 1px;
	text-indent: 9999px;
}
* html .RadScheduler .rsModalWrapper .rsModalWindowClose,
* html .RadScheduler .rsAdvEditClose { text-indent: -9999px; }

.RadScheduler .rsAdvancedEdit .rsAdvEditClose
{
	margin-right: 6px;
}

.RadScheduler .rsModalWrapper .rsModalTitle,
.RadScheduler .rsModalWrapper .rsModalContent,
.RadScheduler .rsModalWrapper .rsModalButtons
{
	padding: 0 44px 0 96px;
}

.RadScheduler .rsModalWrapper .rsModalContent
{
	margin-top: 26px;
	padding-left: 105px;
}

.RadScheduler .rsModalWrapper .rsModalTitle
{
	position: absolute;
	top: 1px; 
	left: 6px;
	padding: 0 0 0 20px;
	font-size: 13px;
	font-weight: normal;
	line-height: 26px;
	background-color: transparent;
	background-position: -284px -520px;
	background-repeat: no-repeat;
}

.RadScheduler .rsModalWrapper .rsModalContent label
{
	display: block;
}

.RadScheduler .rsModalWrapper .rsModalContent input
{
	vertical-align: middle;
}

.RadScheduler .rsModalWrapper .rsModalButtons
{
	clear: both;
	padding: 26px 44px 26px 105px;
	overflow: hidden;
	zoom: 1;
}

.RadScheduler .rsModalWrapper .rsModalButtons a
{
	text-decoration: none;
	width: 73px;
	height: 21px;
	cursor: pointer;
	font-size: 0.92em;
	font-weight: normal;
	line-height: 21px;
	-moz-user-select: none;
	-khtml-user-select: none;
	border: 0;
	float: left;
	text-align: center;
	background-position: 0 -474px;
	background-repeat: no-repeat;
	background-color: transparent;
}

.RadScheduler .rsModalWrapper .rsModalButtons a:hover
{
	background-position: -73px -474px;
}

.RadScheduler .rsModalWrapper .rsModalButtons .rsModalConfirm
{
	margin-right: 9px;
}

.RadScheduler .rsModalWrapper .rsModalIcon
{
	position: absolute;
	
	top: 55px;
	left: 45px;

	width: 32px;
	height: 32px;
	
	overflow: hidden;
	background-position: 0 -526px;
	background-repeat: no-repeat;
	background-color: transparent;
}

/* </modal dialogs> */

/* RadGlitch Fix */

.RadScheduler .rsInnerFix
{
	margin-right: 17px;
}

.RadScheduler .rsOverflowExpand .rsInnerFix
{
	margin-right: 0;
}

/* Vertical Header default width */

.RadScheduler .rsContent .rsSpacerCell div,
.RadScheduler .rsContent .rsAllDayHeader div,
.RadScheduler .rsContent .rsVerticalHeaderTable th,
.RadScheduler .rsContent .rsVerticalHeaderTable th div
{
	min-width: 52px;
}

* html .RadScheduler .rsContent .rsSpacerCell div, 
* html .RadScheduler .rsContent .rsAllDayHeader div,
* html .RadScheduler .rsContent .rsVerticalHeaderTable th,
* html .RadScheduler .rsContent .rsVerticalHeaderTable th div { width: 52px; } /*IE6 and IE7 quirks*/
* html .RadScheduler .rsContent .rsVerticalHeaderSized th { width: 100%; } /* Fix for sized headers */

*+html .RadScheduler .rsContent .rsSpacerCell div,
*+html .RadScheduler .rsContent .rsAllDayHeader div,
*+html .RadScheduler .rsContent .rsVerticalHeaderTable th div { width: 52px; } /*IE7*/

/* /Vertical Header default width */

/* Fix for client rendering wrappers in IE6 */

.RadScheduler .rsAdvancedInsertWrapper,
.RadScheduler .rsAdvancedEditWrapper
{
	position: relative;
}

/* /Fix for client rendering wrappers in IE6 */

table.RadCalendarTimeView td a
{
	text-transform: lowercase;
	text-align: right;
}

table.RadCalendarTimeView tr td
{
	padding-top: 1px; padding-bottom: 1px;
}

/* Printing styles */
@media print 
{
    div.RadScheduler, 
    div.RadScheduler .rsContentScrollArea, 
    div.RadScheduler .rsContentWrapper, 
    div.RadScheduler .rsVerticalHeaderWrapper,
    div.RadScheduler .rsVerticalHeaderWrapper div
    { 
        height: auto !important;
    }

    div.RadScheduler, 
    div.RadScheduler .rsTopWrap
    {
        overflow: visible !important;
    }

    div.RadScheduler .rsContentScrollArea
    {
        overflow: hidden !important;
    }
    
    div.RadScheduler .rsInnerFix
    {
    	margin-right: 0px !important;
    }
}

/* <hidden appointment indicators> */

.RadScheduler .rsTopIndicator
{
    position: absolute;
    top: 0;            
}

.RadScheduler .rsBottomIndicator
{
    position: relative;
    top: -14px;            
}      

.RadScheduler .rsArrowContainer
{            
    left: 0;
    table-layout: fixed;
    background: transparent;
    z-index: 100;
}

.RadScheduler .rsArrowContainer tr
{
	vertical-align: top;
}

.RadScheduler .rsArrowContainer tr td
{
	background: none;
	border: 0;
    font-size: 0;
    line-height: 0;
	position: relative;
    vertical-align: bottom;
}

.RadScheduler .rsArrowWrap
{
	position: relative;
}

.RadScheduler .rsOvertimeArrow
{        	
	display: block;
	width: 45px;
	height: 8px;
	font-size: 0;
	position: absolute;
	top: 3px;
	margin-left:-23px;
	left: 50%;
    text-decoration: none;
}
	
.RadScheduler .rsBottomIndicator .rsOvertimeArrow:hover
{
	background-position: -180px -40px;
}

.RadScheduler .rsTopIndicator .rsOvertimeArrow:hover
{
	background-position: -134px -40px;
}

/* </hidden appointment indicators> */