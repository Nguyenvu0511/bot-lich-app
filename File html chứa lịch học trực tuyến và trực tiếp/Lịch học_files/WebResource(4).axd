/*Telerik RadCalendar Sitefinity skin*/

table.RadCalendar_Sitefinity
{
	border-collapse:separate;
	border:0;
	background:#fff;
	color:#333;
	font:12px arial,sans-serif;
}

/*titlebar*/

.RadCalendar_Sitefinity .rcTitlebar
{
	width:100%;
	border:1px solid #ddd;
	padding:0;
	color:#000;
}

.RadCalendar_Sitefinity .rcTitlebar table
{
	width:100%;
	border-collapse:separate;
	border:0;
	font:10px/20px arial,sans-serif;
	text-transform:uppercase;
	letter-spacing:1px;
}

.RadCalendar_Sitefinity .rcTitlebar td
{
	border:0;
	padding:2px 0 2px;
	text-align:center;
	vertical-align:middle;
}

.RadCalendar_Sitefinity .rcTitlebar .rcTitle
{
	width:100%;
	cursor:pointer;
}
.RadCalendar_Sitefinity .rcNoNav .rcTitle
{
	cursor:default;
}

.RadCalendar_Sitefinity .rcTitlebar .rcPrev,
.RadCalendar_Sitefinity .rcTitlebar .rcNext,
.RadCalendar_Sitefinity .rcTitlebar .rcFastPrev,
.RadCalendar_Sitefinity .rcTitlebar .rcFastNext
{
	display:block;
	width:17px;
	height:17px;
	overflow:hidden;
	margin:0 3px;
	background:transparent no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	text-indent:-1111px;
	text-decoration:none;
	color:#ccc;
}

.RadCalendar_Sitefinity .rcTitlebar .rcFastPrev
{
	margin-left:5px;
	background-position:0 0;
}

.RadCalendar_Sitefinity .rcTitlebar .rcFastPrev:hover
{
	background-position:0 -50px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcPrev
{
	background-position:0 -100px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcPrev:hover
{
	background-position:0 -150px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcNext
{
	background-position:0 -200px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcNext:hover
{
	background-position:0 -250px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcFastNext
{
	margin-right:5px;
	background-position:0 -300px;
}

.RadCalendar_Sitefinity .rcTitlebar .rcFastNext:hover
{
	background-position:0 -350px;
}

.RadCalendar_Sitefinity .rcMain
{
	width:100%;
	border:1px solid #ddd;
	border-top:0;
	padding:0;
}

.RadCalendar_Sitefinity .rcMainTable
{
	border-collapse:separate;
	border:0;
	width:100%;
	font:12px/20px arial,sans-serif;
}

/*header, footer*/

.RadCalendar_Sitefinity .rcHeader,
.RadCalendar_Sitefinity .rcFooter
{
	border:1px solid #ddd;
	border-top:0;
	padding:0;
}

/*week numbers and days*/

.RadCalendar_Sitefinity .rcRow th,
.RadCalendar_Sitefinity .rcWeek th
{
	border:0;
	font-weight:normal;
	text-align:center;
	cursor:default;
}

.RadCalendar_Sitefinity .rcWeek th
{
	padding:4px 0 0 0;
	border-bottom:1px solid #ddd;
	font-size:10px;
}

.RadCalendar_Sitefinity .rcRow th
{
	width:28px;
	padding:0;
	color:#777;
}

.RadCalendar_Sitefinity .rcWeek .rcViewSel
{
	border-bottom-color:#fff;
}

.RadCalendar_Sitefinity .rcViewSel,
.RadCalendar_Sitefinity .rcRow th
{
	background:#eee;
}

.RadCalendar_Sitefinity .rcRow th,
.RadCalendar_Sitefinity .rcRow td
{
	vertical-align:middle;
}

/*date cells*/

.RadCalendar_Sitefinity .rcRow td
{
	width:26px;
	border:0;
	padding:0 0 1px 1px;
	text-align:right;
}

.RadCalendar_Sitefinity .rcMain .rcRow a,
.RadCalendar_Sitefinity .rcMain .rcRow span
{
	display:block;
	width:20px;
	padding:0 6px 0 0;
	text-decoration:none;
	color:#105cb6;
}

.RadCalendar_Sitefinity .rcPreview .rcRow a
{
	outline:none;
}

.RadCalendar_Sitefinity .rcMain .rcWeekend a
{
	color:#4f7eb6;
}

.RadCalendar_Sitefinity .rcMain .rcRow .rcToday a
{
	background:100% -1400px no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
}

.RadCalendar_Sitefinity .rcMain .rcOtherMonth a
{
	color:#777;
}

.RadCalendar_Sitefinity .rcMain .rcOutOfRange span
{
	color:#777;
	cursor:default;
}

.RadCalendar_Sitefinity .rcMain .rcRow .rcHover a
{
	background:100% -1200px no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	color:#000;
}

.RadCalendar_Sitefinity .rcMain .rcRow .rcSelected a
{
	background:100% -1300px no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	color:#000;
}

/*multimonth view*/

table.RadCalendarMultiView_Sitefinity
{
	width:auto;
	border:0;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar
{
	border:1px solid #ccc;
	padding:0;
	background:#dee2e7;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar table
{
	border:0;
	line-height:26px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar td
{
	border:0;
	padding-top:3px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcFastPrev
{
	width:19px;
	height:19px;
	background-position:0 -400px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcFastPrev:hover
{
	background-position:0 -450px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcPrev
{
	width:19px;
	height:19px;
	background-position:0 -500px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcPrev:hover
{
	background-position:0 -550px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcNext
{
	width:19px;
	height:19px;
	background-position:0 -600px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcNext:hover
{
	background-position:0 -650px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcFastNext
{
	width:19px;
	height:19px;
	background-position:0 -700px;
}

.RadCalendarMultiView_Sitefinity .rcTitlebar .rcFastNext:hover
{
	background-position:0 -750px;
}

.RadCalendarMultiView_Sitefinity .rcMain
{
	border-color:#ccc;
}

.RadCalendarMultiView_Sitefinity .rcCalendar
{
	border:1px solid #ddd;
	padding:0;
}

.RadCalendarMultiView_Sitefinity .rcCalendar .rcMainTable
{
	width:210px;
}

.RadCalendarMultiView_Sitefinity .rcMain .rcTitle
{
	border:0;
	border-bottom:1px solid #ddd;
	padding:3px 0 2px;
	color:#000;
	text-align:center;
	font-size:10px;
	text-transform:uppercase;
	letter-spacing:1px;
}

/*month view*/

table.RadCalendarMonthView_Sitefinity
{
	border-collapse:separate;
	border:1px solid;
	border-color:#ededed #c4c4c4 #8e8e8e #c4c4c4;
	background:#fff;
	font:12px arial,sans-serif;
	color:#333;
}

table.RadCalendarMonthView_Sitefinity td
{
	border:0;
	padding:5px 3px 0;
}

.RadCalendarMonthView_Sitefinity #rcMView_Feb,
.RadCalendarMonthView_Sitefinity #rcMView_Apr,
.RadCalendarMonthView_Sitefinity #rcMView_Jun,
.RadCalendarMonthView_Sitefinity #rcMView_Aug,
.RadCalendarMonthView_Sitefinity #rcMView_Oct,
.RadCalendarMonthView_Sitefinity #rcMView_Dec
{
	border-right:1px solid #e0e0e0;
}

.RadCalendarMonthView_Sitefinity a
{
	display:block;
	padding:2px 4px;
	text-align:center;
	text-decoration:none;
	color:#105cb6;
}

.RadCalendarMonthView_Sitefinity .rcHover a
{
	border:1px solid #dee2e7;
	padding:1px 3px;
	background:#f0f0f0;
}

.RadCalendarMonthView_Sitefinity .rcSelected a
{
	border:1px solid #ffe0a3;
	padding:1px 3px;
	background:#ffffe1;
	color:#000;
}

.RadCalendarMonthView_Sitefinity #rcMView_PrevY a,
.RadCalendarMonthView_Sitefinity #rcMView_NextY a
{
	display:block;
	width:17px;
	height:17px;
	overflow:hidden;
	margin:0 auto;
	background:transparent no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	text-indent:-1111px;
	text-align:center;
	text-decoration:none;
	color:#ccc;
}

.RadCalendarMonthView_Sitefinity #rcMView_PrevY a
{
	background-position:3px -100px;
}

.RadCalendarMonthView_Sitefinity #rcMView_NextY a
{
	background-position:3px -200px;
}

.RadCalendarMonthView_Sitefinity #rcMView_PrevY a:hover
{
	background-position:3px -150px;
}

.RadCalendarMonthView_Sitefinity #rcMView_NextY a:hover
{
	background-position:3px -250px;
}

.RadCalendarMonthView_Sitefinity .rcButtons
{
	border:0;
	padding:4px 7px 6px;
	text-align:center;
}

.RadCalendarMonthView_Sitefinity input
{
	border:1px solid;
	border-color:#ccc #666 #666 #ccc;
	margin:0 3px;
	padding:1px 0 0;
	background:#efefef;
	color:#333;
	font:12px arial,sans-serif;
	cursor:pointer;
}

.RadCalendarMonthView_Sitefinity input:hover
{
	color:#000;
	background:#fff;
}

.RadCalendarMonthView_Sitefinity #rcMView_Today
{
	padding:1px 3px 0;
}

.RadCalendarMonthView_Sitefinity #rcMView_OK
{
	margin-left:20px;
	padding:1px 3px 0;
}

.RadCalendarMonthView_Sitefinity #rcMView_Cancel,
.RadCalendarMonthView_Sitefinity #rcMView_Cancel:hover
{
	border:0;
	background:none transparent;
	color:#105cb6;
}

/*time view*/

table.RadCalendarTimeView_Sitefinity
{
	border-collapse:separate;
	border:1px solid;
	border-color:#ededed #c4c4c4 #8e8e8e #c4c4c4;
	background:#fff;
	font:12px arial,sans-serif;
	color:#333;
}

.RadCalendarTimeView_Sitefinity th
{
	border:0;
	border-bottom:1px solid #ddd;
	padding:3px 0;
	color:#000;
	line-height:18px;
	font-size:10px;
	text-transform:uppercase;
	font-weight:normal;
	letter-spacing:1px;
	text-align:center;
	cursor:default;
}

table.RadCalendarTimeView_Sitefinity td
{
	border:0;
	border-left:1px solid #ddd;
	padding:2px 2px 3px;
}

table.RadCalendarTimeView_Sitefinity td:first-child
{
	border-left:0;
}

.RadCalendarTimeView_Sitefinity a
{
	display:block;
	width:58px;
	padding:2px 6px 2px 1px;
	line-height:15px;
	text-align:right;
	color:#105cb6;
	text-decoration:none;
}

.RadCalendarTimeView_Sitefinity td.rcSelected a
{
	background:100% -1900px no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	color:#000;
}

.RadCalendarTimeView_Sitefinity td.rcHover a
{
	background:100% -1800px no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	color:#000;
}

.RadCalendarTimeView_Sitefinity .rcFooter
{
	border-top:1px solid #ddd;
	padding:0;
}

/*pickers*/

.RadPicker_Sitefinity,
.RadPicker_Sitefinity td
{
	vertical-align:middle;
}

.RadPicker_Sitefinity .RadInput
{
	vertical-align:baseline;
}

.RadPicker_Sitefinity table.rcTable,
.RadPicker_Sitefinity table.rcTable td
{
	border:0;
	margin:0;
	padding:0;
}

.RadPicker_Sitefinity table.rcTable .rcInputCell
{
	padding:0 4px 0 0;
}

.RadPicker_Sitefinity td a
{
	position:relative;/*FF*/
	outline:none;/*FF*/
	z-index:2;/*Opera*/
	margin:0 2px;
	text-decoration:none;
}
* html .RadPicker_Sitefinity td a{position:static}/*IE6*/
*+html .RadPicker_Sitefinity td a{position:static}/*IE7*/

.RadPicker_Sitefinity .rcCalPopup,
.RadPicker_Sitefinity .rcTimePopup
{
	display:block;
	width:22px;
	height:22px;
	overflow:hidden;
	background:no-repeat url('WebResource.axd?d=bAXGNxgpwz4m8d1RFR-dfl63RgHShSWrb9S5EpRoZyxfX-nLipoYK7AUlc_DuPIVlsHeWdH4xUyYv8j1S8xGtjr2TRTKMv6VVHtCw7wlEI1KvZHOwUwepKtpYLjD-vK1hJYNaaqRoZntqnfMwNXhd5HrZPg1&t=634469285920000000');
	text-indent:-1111px;
	text-align:center;
}

.RadPicker_Sitefinity .rcCalPopup
{
	background-position:0 -2000px;
}

.RadPicker_Sitefinity .rcTimePopup
{
	background-position:0 -2100px;
}

.RadPicker_Sitefinity .rcDisabled,
.RadCalendarMonthView_Sitefinity .rcDisabled
{
	opacity:0.5;
	filter:alpha(opacity=50);
}

/*rtl*/

.RadCalendarRTL_Sitefinity .rcTitlebar .rcFastPrev
{
	background-position:0 -300px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcFastPrev:hover
{
	background-position:0 -350px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcPrev
{
	background-position:0 -200px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcPrev:hover
{
	background-position:0 -250px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcNext
{
	background-position:0 -100px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcNext:hover
{
	background-position:0 -150px;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcFastNext
{
	background-position:0 0;
}

.RadCalendarRTL_Sitefinity .rcTitlebar .rcFastNext:hover
{
	background-position:0 -50px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcFastPrev
{
	background-position:0 -700px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcFastPrev:hover
{
	background-position:0 -750px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcPrev
{
	background-position:0 -600px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcPrev:hover
{
	background-position:0 -650px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcNext
{
	background-position:0 -500px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcNext:hover
{
	background-position:0 -550px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcFastNext
{
	background-position:0 -400px;
}

.RadCalendarMultiViewRTL_Sitefinity .rcTitlebar .rcFastNext:hover
{
	background-position:0 -450px;
}
