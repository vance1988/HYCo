/**
The MIT License (MIT) * Copyright (c) 2016 铭飞科技(mingsoft.net)

 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.mingsoft.util;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期通用处理类
 * @author 王天培QQ:78750478
 * @version 
 * 版本号：100-000-000<br/>
 * 创建日期：2012-03-15<br/>
 * 历史修订：<br/>
 */
public class DateUtil {

	/**
	 * 年
	 */
	private int year;
	
	/**
	 * 月
	 */
	private int month;

	/**
	 * 日
	 */
	private int day;

	/**
	 * 小时
	 */
	private int hour;

	/**
	 * 分钟
	 */
	private int minute;

	/**
	 * 秒
	 */
	private int second;

	/**
	 * 平年每个月份的天数
	 */
	private static final int[] dayArray = new int[] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };// 每月的天数

	/**
	 * 标准日期格式：
	 * 		MM/dd/yyyy
	 */
	public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");

	/**
	 * 标准时间格式：
	 * 		MM/dd/yyyy HH:mm
	 */
	public static final SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("MM/dd/yyyy HH:mm");

	/**
	 * 带时分秒的标准时间格式：
	 * 		MM/dd/yyyy HH:mm:ss
	 */
	public static final SimpleDateFormat DATE_TIME_EXTENDED_FORMAT = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

	/**
	 * ORA标准日期格式：
	 * 		yyyyMMdd
	 */
	public static final SimpleDateFormat ORA_DATE_FORMAT = new SimpleDateFormat("yyyyMMdd");

	/**
	 * ORA标准时间格式：
	 * 		yyyyMMddHHmm
	 */
	public static final SimpleDateFormat ORA_DATE_TIME_FORMAT = new SimpleDateFormat("yyyyMMddHHmm");

	/**
	 * 带时分秒的ORA标准时间格式：
	 * 		yyyyMMddHHmmss
	 */
	public static final SimpleDateFormat ORA_DATE_TIME_EXTENDED_FORMAT = new SimpleDateFormat("yyyyMMddHHmmss");

	/**
	 * 时间格式：
	 * 		yyyy-MM-dd
	 */
	public static final SimpleDateFormat CHN_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 时间格式：
	 * 		yyyy-MM-dd HH:mm
	 */
	public static final SimpleDateFormat CHN_DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	/**
	 * 时间格式：
	 * 		yyyy-MM-dd HH:mm:ss
	 */
	public static final SimpleDateFormat CHN_DATE_TIME_EXTENDED_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /** 年月日时分秒(无下划线)：yyyyMMddHHmmss */
    public static final String dtLong = "yyyyMMddHHmmss";
    
    /** 完整时间：yyyy-MM-dd HH:mm:ss */
    public static final String simple = "yyyy-MM-dd HH:mm:ss";
    
    /** 年月日(无下划线)：yyyyMMdd */
    public static final String dtShort = "yyyyMMdd";	

    
    /**
     * 返回系统当前时间(精确到毫秒)</br>
     * @return 返回以yyyyMMddHHmmss为格式的当前系统时间
     */
	public  static String getOrderNum(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(dtLong);
		return df.format(date);
	}    
    
	/**
	 * 无参构造函数，默认的日期为系统时间
	 */
	public DateUtil() {
		today();
	}

	/**
	 * 有参构造函数
	 * 
	 * @param inValue 14位日期格式的字符串，不满14位的，后面补0处理<br>
	 *            列：new DataUtil("yyyyMMddHHmmss");
	 */
	DateUtil(String inValue) {
		SetDate(inValue);
	}

	/**
	 * 有参构造函数
	 * 
	 * @param mills 毫秒数<br>
	 */
	public DateUtil(long mills) {
		setTimeInMillis(mills);
	}

	/**
	 * 有参构造函数
	 * 
	 * @param year 年<br>
	 * @param month 月<br>
	 * @param day 日<br>
	 * @param hour 时<br>
	 * @param minute 分<br>
	 * @param second 秒<br>
	 */
	public DateUtil(int year, int month, int day, int hour, int minute, int second) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, day, hour, minute, second);
		this.year = calendar.get(Calendar.YEAR);
		this.month = calendar.get(Calendar.MONTH) + 1;
		this.day = calendar.get(Calendar.DAY_OF_MONTH);
		this.hour = calendar.get(Calendar.HOUR_OF_DAY);
		this.minute = calendar.get(Calendar.MINUTE);
		this.second = calendar.get(Calendar.SECOND);

	}

	/**
	 * 设置日期函数
	 * 
	 * @param inValue 日期
	 */
	private void SetDate(String inValue) {
		if (inValue.length() != 14) {// 不够14位日期格式的，后面都补0处理
			for (int i = inValue.length(); i < 14; i++) {
				inValue = inValue + "0";
			}
			System.out.println(inValue);
		}
		try {

			int year = Integer.parseInt(inValue.substring(0, 4));
			int month = Integer.parseInt(inValue.substring(4, 6));
			int day = Integer.parseInt(inValue.substring(6, 8));
			int hour = Integer.parseInt(inValue.substring(8, 10));
			int minute = Integer.parseInt(inValue.substring(10, 12));
			int second = Integer.parseInt(inValue.substring(12));

			Calendar calendar = Calendar.getInstance();
			calendar.set(year, month - 1, day, hour, minute, second);
			this.year = calendar.get(Calendar.YEAR);
			this.month = calendar.get(Calendar.MONTH) + 1;
			this.day = calendar.get(Calendar.DAY_OF_MONTH);
			this.hour = calendar.get(Calendar.HOUR_OF_DAY);
			this.minute = calendar.get(Calendar.MINUTE);
			this.second = calendar.get(Calendar.SECOND);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * 取得当前时间
	 */
	private void today() {
		Calendar calendar = Calendar.getInstance();
		this.year = calendar.get(Calendar.YEAR);
		this.month = calendar.get(Calendar.MONTH) + 1;
		this.day = calendar.get(Calendar.DAY_OF_MONTH);
		this.hour = calendar.get(Calendar.HOUR_OF_DAY);
		this.minute = calendar.get(Calendar.MINUTE);
		this.second = calendar.get(Calendar.SECOND);
	}

	/**
	 * 
	 * 格式化日期
	 * 
	 * @param DateFormat 日期的格式 <br>
	 * @return 返回字符串类型的日期
	 */
	public String format(SimpleDateFormat DateFormat) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(this.year, this.month - 1, this.day, this.hour, this.minute, this.second);
		return DateFormat.format(calendar.getTime());
	}

	/**
	 * toString方法 用yyyy-MM-dd HH:mm:ss格式
	 * @return 返回转换成字符串格式的日期
	 */
	public String toString() {
		return this.format(DateUtil.CHN_DATE_TIME_EXTENDED_FORMAT);
	}

	/**
	 * 获取当前日期
	 * @return 返回日期
	 */
	public Date getDate() {
		
		 Calendar date = Calendar.getInstance();
         date.set(Calendar.DAY_OF_MONTH, this.getDay());
         date.set(Calendar.MONTH,this.getMonth()-1);
         date.set(Calendar.YEAR,this.getYear());
         date.set(Calendar.HOUR_OF_DAY,this.getHour());
         date.set(Calendar.MINUTE,this.getMinute());
         date.set(Calendar.SECOND,this.getSecond());
		return date.getTime();

	}

	/**
	 * 获取毫秒数
	 * 
	 * @return 返回毫秒数
	 */
	public long getTimeInMillis() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(this.year, this.month - 1, this.day, this.hour, this.minute, this.second);
		return calendar.getTime().getTime();
	}

	/**
	 * 根据毫秒数来设置日期
	 * 
	 * @param mills 毫秒数
	 */
	public void setTimeInMillis(long mills) {
		Date dd = new Date(mills);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dd);
		this.year = calendar.get(Calendar.YEAR);
		this.month = calendar.get(Calendar.MONTH) + 1;
		this.day = calendar.get(Calendar.DAY_OF_MONTH);
		this.hour = calendar.get(Calendar.HOUR_OF_DAY);
		this.minute = calendar.get(Calendar.MINUTE);
		this.second = calendar.get(Calendar.SECOND);

	}

	/**
	 * 判断当前年是否是闰年
	 * 
	 * @return 如果是闰年，则返回true，否则返回false
	 */
	public boolean isLeapYear() {
		return this.isLeapYear(year);
	}

	/**
	 * 判断是否是闰年
	 * 
	 * @param year 年份<br>
	 * @return 如果是闰年，则返回true，否则返回false
	 */
	public boolean isLeapYear(int year) {
		if ((year % 400) == 0)
			return true;
		else if ((year % 4) == 0) {
			if ((year % 100) == 0)
				return false;
			else
				return true;
		} else
			return false;
	}

	/**
	 * 日期增减操作
	 * 
	 * @param years 年数<br>
	 * @param months 月数<br>
	 * @param days 日数<br>
	 * @param hours 小时数<br>
	 * @param minutes 分数<br>
	 * @param seconds 秒数<br>
	 */
	public void setDateTime(int years, int months, int days, int hours, int minutes, int seconds) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(this.year + years, this.month - 1 + months, this.day + days, this.hour + hours, this.minute + minutes, this.second + seconds);
		setTimeInMillis(calendar.getTime().getTime());
	}

	/**
	 * 年增减操作
	 * 
	 * @param years 年份 <br>
	 */
	public void addYear(int years) {
		if (month == 2 && day == 29)// 当前时间是闰年并且日期是2月29号
		{
			if (this.isLeapYear(year + years) == true)// 目标年是闰年时
				this.setDateTime(years, 0, 0, 0, 0, 0);
			else
				this.setDateTime(years, 0, -1, 0, 0, 0);// 目标年不是闰年，则2月只有28天，天数减去1
		} else
			this.setDateTime(years, 0, 0, 0, 0, 0);
	}

	/**
	 * 月增减操作(与oracle对月份增减的操作一样)
	 * 
	 * @param months 月数 <br>
	 */
	public void addMonth(int months) {
		int this_day_end = daysOfMonth();// 本月的天数
		int that_day_end = dayOfMonth(months);// 离现在n个月的天数
		if (this.day == this_day_end)
			this.day = that_day_end;// 如果现在是本月的最后一天,则day设置成that_day_end
		else if (this.day > that_day_end)
			this.day = that_day_end; // 如果离现在n个月的天数that_day_end比现在的day小,则现在的day设置成that_day_end

		this.setDateTime(0, months, 0, 0, 0, 0);
	}

	/**
	 * 天数增减操作
	 * 
	 * @param days 天数
	 */
	public void addDay(int days) {
		this.setDateTime(0, 0, days, 0, 0, 0);
	}

	/**
	 * 小时增减操作
	 * 
	 * @param hours 小时数
	 */
	public void addHour(int hours) {
		this.setDateTime(0, 0, 0, hours, 0, 0);
	}

	/**
	 * 分钟增减操作
	 * 
	 * @param minutes 分钟数
	 */
	public void addMinute(int minutes) {
		this.setDateTime(0, 0, 0, 0, minutes, 0);
	}

	/**
	 * 秒增减操作
	 * 
	 * @param seconds 秒数
	 */
	public void addSecond(int seconds) {
		this.setDateTime(0, 0, 0, 0, 0, seconds);
	}

	/**
	 * 取本月中有多少天
	 * 
	 * @return 返回本月的实际天数
	 */
	public int daysOfMonth() {
		if (month > 12 || month < 0)
			return 0;
		if (month == 2 && this.isLeapYear())
			return 29;
		else
			return dayArray[month - 1];
	}

	/**
	 * 获取离当前时间几个月的月份的天数
	 * 
	 * @param monthNumber 月数<br>
	 * @return 返回当前时间月份天数
	 */
	public int dayOfMonth(int monthNumber) {
		int yy = monthNumber / 12;
		int mm = monthNumber % 12;
		int year = this.year + yy;
		int month = this.month + mm;

		if (month > 12) {
			month = month - 12;
			year = year + 1;
		}
		if (month < 1) {
			month = month + 12;
			year = year - 1;
		}

		if (month == 2 && isLeapYear(year))
			return 29;
		else
			return dayArray[month - 1];
	}

	/**
	 * 两个日期之间的秒数
	 * 
	 * @param firstDate 第一个日期<br>
	 * @param Lastdate 最后一个日期<br>
	 * @return 返回两个日期之间的秒数
	 */
	public static long diffSec(DateUtil firstDate, DateUtil Lastdate) {
		return (firstDate.getTimeInMillis() - Lastdate.getTimeInMillis()) / 1000;
	}

	/**
	 * 两个日期之间之间的天数
	 * 
	 * @param firstDate 开始时间<br>
	 * @param Lastdate 结束时间<br>
	 * @return 返回两个日期之间之间的天数
	 */
	public static int diffMonth(Date firstDate, Date Lastdate) {
			if (firstDate.after(Lastdate)) {
				Date t = firstDate;
				firstDate = Lastdate;
				Lastdate = t;
			}
			Calendar startCalendar = Calendar.getInstance();
			startCalendar.setTime(firstDate);
			Calendar endCalendar = Calendar.getInstance();
			endCalendar.setTime(Lastdate);
			Calendar temp = Calendar.getInstance();
			temp.setTime(Lastdate);
			temp.add(Calendar.DATE, 1);

			int year = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
			int month = endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);

			if ((startCalendar.get(Calendar.DATE) == 1) && (temp.get(Calendar.DATE) == 1)) {
				return year * 12 + month + 1;
			} else if ((startCalendar.get(Calendar.DATE) != 1) && (temp.get(Calendar.DATE) == 1)) {
				return year * 12 + month;
			} else if ((startCalendar.get(Calendar.DATE) == 1) && (temp.get(Calendar.DATE) != 1)) {
				return year * 12 + month;
			} else {
				return (year * 12 + month - 1) < 0 ? 0 : (year * 12 + month);
			}
	}
	
	/**
	 * 两个日期之间之间的天数
	 * 
	 * @param firstDate 开始日期 <br>
	 * @param Lastdate 结束日期 <br>
	 * @return 返回两个日期之间之间的天数
	 */
	public static int diffDay(DateUtil firstDate, DateUtil Lastdate) {
		return (int) (firstDate.getTimeInMillis() - Lastdate.getTimeInMillis()) / 1000 / (3600 * 24);
	}
	/**
	 * 两个日期之间之间的天数 mydate1-mydate2的天数
	 * 
	 * @param firstDate 开始日期 <br>
	 * @param Lastdate 结束日期 <br>
	 * @return 返回两个日期之间之间的天数
	 */
	public static int diffDay(Date firstDate, Date Lastdate) {
		firstDate = DateUtil.stringToDate(DateUtil.dateFmtToString(firstDate, "yyyy-MM-dd"),"yyyy-MM-dd");
		Lastdate = DateUtil.stringToDate(DateUtil.dateFmtToString(Lastdate, "yyyy-MM-dd"),"yyyy-MM-dd");
		int _day = (int) ((firstDate.getTime()- Lastdate.getTime()) / 1000 / (3600 * 24));
		return _day;
	}
	
	/**
	 * 计算两个时间间隔天数
	 * 
	 * @param firstDate 开始时间
	 * @param Lastdate 结束时间
	 * @return 返回两个时间间隔天数
	 */
	public static int diffDays(Calendar firstDate, Calendar Lastdate) {
		if (firstDate.after(Lastdate)) {
			java.util.Calendar swap = firstDate;
			firstDate = Lastdate;
			Lastdate = swap;
		}
		int days = Lastdate.get(Calendar.DAY_OF_YEAR) - firstDate.get(Calendar.DAY_OF_YEAR);
		int y2 = Lastdate.get(Calendar.YEAR);
		if (firstDate.get(Calendar.YEAR) != y2) {
			firstDate = (Calendar) firstDate.clone();
			do {
				days += firstDate.getActualMaximum(Calendar.DAY_OF_YEAR);// 得到当年的实际天数
				firstDate.add(Calendar.YEAR, 1);
			} while (firstDate.get(Calendar.YEAR) != y2);
		}
		return days;
	}

	/**
	 * 增加天数
	 * 
	 * @param date 时间<br>
	 * @param day 天数<br>
	 * @return 返回增加过天数后的日期
	 */
	public static Date addDays(Date date, int day) {
		if (date == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) + day);
		return c.getTime();
	}
	
	/**
	 * 减少天数
	 * 
	 * @param date 时间<br>
	 * @param day 天数<br>
	 * @return 返回减少过天数的日期
	 */
	public static Date removeDays(Date date, int day) {
		if (date == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.get(Calendar.DAY_OF_MONTH) - day);
		return c.getTime();
	}
	
	/**
	 * 增加月份
	 * 
	 * @param date 时间<br>
	 * @param month 天数<br>
	 * @return 返回增加过天数的日期
	 */
	public static Date addMonths(Date date, int month) {
		if (date == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.MONTH, c.get(Calendar.MONTH) + month);
		return c.getTime();
	}
	
	/**
	 * 减少月份
	 * 
	 * @param date 时间<br>
	 * @param month 月数<br>
	 * @return 返回减少月份后的日期
	 */
	public static Date removeMonths(Date date, int month) {
		if (date == null)
			return null;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.MONTH, c.get(Calendar.MONTH) - month);
		return c.getTime();
	}

	/**
	 * 格式化时间
	 * 
	 * @param date Date类型日期<br>
	 * @param fmt 格式化格式<br>
	 * @return 返回格式化后的时间字符串
	 */
	public static String dateFmtToString(Date date, SimpleDateFormat fmt) {
		return fmt.format(date);
	}
	
	/**
	 * 格式化时间,默认格式yyyy-MM-dd hh:mm:ss
	 * 
	 * @param date Date类型日期<br>
	 * @return 返回格式化后的时间字符串
	 */
	public static String dateFmtToString(Date date) {
		return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
	}

	
	/**
	 * 格式化时间
	 * 
	 * @param date Date类型日期<br>
	 * @param fmt 格式化格式<br>
	 * @return 返回格式化后的时间字符串
	 */
	public static String dateFmtToString(Date date, String fmt) {
		return new SimpleDateFormat(fmt).format(date);
	}

	/**
	 * 字符串转日期
	 * 
	 * @param date 日期字符串类<br>
	 * @return 返回Date类型日期
	 */
	public static Date stringToDate(String date) {
		return java.sql.Date.valueOf(date);
	}


	/**
	 * 字符串转时间
	 * @param date 日期字符串
	 * @param ftm 格式
	 * @return 返回Date类型日期，转换失败返回null
	 */
	public static Date stringToDate(String date,String ftm) {
		SimpleDateFormat sdf = new SimpleDateFormat(ftm);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 字符串转日期，可以按一定格式
	 * 
	 * @param date 日期字符串<br>
	 * @param dataFmt 格式化后的日期<br>
	 * @return 返回Date类型日期
	 */
	public static Date stringFmtToDate(String date, String dataFmt) {
		SimpleDateFormat df = new SimpleDateFormat(dataFmt);
		return java.sql.Date.valueOf(df.format(java.sql.Date.valueOf(date)));
	}

	/**
	 * Data类型转换成Timestamp类型
	 * 
	 * @param date 日期
	 * @return 返回Timestamp类型日期
	 */
	public static Timestamp dateToTimestamp(Date date) {
		String temp = CHN_DATE_TIME_EXTENDED_FORMAT.format(date);
		return Timestamp.valueOf(temp);
	}

	/**
	 * 获取当前日
	 * 
	 * @return 返回当前日
	 */
	public int getDay() {
		return day;
	}

	/**
	 * 设置当前日
	 * 
	 * @param day 当前日
	 */
	public void setDay(int day) {
		this.day = day;
	}

	/**
	 * 获取当前时
	 * 
	 * @return hour 返回当前时
	 */
	public int getHour() {
		return hour;
	}

	/**
	 * 设置当前时
	 * 
	 * @param hour 当前时
	 */
	public void setHour(int hour) {
		this.hour = hour;
	}

	/**
	 * 获取当前分
	 * 
	 * @return minute 返回当前分
	 */
	public int getMinute() {
		return minute;
	}

	/**
	 * 设置当前分
	 * 
	 * @param  minute 当前分
	 */
	public void setMinute(int minute) {
		this.minute = minute;
	}

	/**
	 * 获取当前月
	 * 
	 * @return month 返回当前月
	 */
	public int getMonth() {
		return month;
	}

	/**
	 * 设置当前月
	 * 
	 * @param month 当前月
	 */
	public void setMonth(int month) {
		this.month = month;
	}

	/**
	 * 获取当前秒
	 * 
	 * @return second 返回当前秒
	 */
	public int getSecond() {
		return second;
	}

	/**
	 * 设置当前秒
	 * 
	 * @param second 当前秒
	 */
	public void setSecond(int second) {
		this.second = second;
	}

	/**
	 * 获取当前年
	 * 
	 * @return year 返回当前年
	 */
	public int getYear() {
		return year;
	}

	/**
	 * 设置当前年
	 * 
	 * @param year 当前年
	 */
	public void setYear(int year) {
		this.year = year;
	}
	
	/**
	 * 判断两时间段是否有交集
	 * @param start1 第一段开始时间
	 * @param end1 第一段结束时间
	 * @param start2 第二段开始时间
	 * @param end2 第二段结束时间
	 * @return 如果有交集，则返回true，否则返回false
	 */
	public boolean hasCommon(Date start1 , Date end1 ,Date start2 , Date end2){
		if(end1.before(start2)||end2.before(start1))
			return false;
		else
			return true;
	}
	
	/**
	 * 判断日期格式 是否有字母等 不合法的
	 * @param date 字符串的日期
	 * @return 如果有字母等，则返回true，否则返回false
	 */
	public static boolean judgeDateMsg(String date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 日期格式化
		try{
			java.sql.Date.valueOf(df.format(java.sql.Date.valueOf(date)));
		}catch (NumberFormatException e){
			return false;
		}
		return true;
	}
	
	/**
	 * 计算两个日期之间的间隔的天数
	 * @param  beginDate 开始日期
	 * @param  endDate 结束日期
	 * @return 返回间隔的天数
	 */
	public static int daysBetween(String beginDate,String endDate){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        Calendar cal = Calendar.getInstance();    
        Calendar cal2 = Calendar.getInstance();
        try {
			cal.setTime(sdf.parse(beginDate));
			cal2.setTime(sdf.parse(endDate));    
			long time1 = cal.getTimeInMillis();                 
	        long time2 = cal2.getTimeInMillis();         
	        long between_days=(time2-time1)/(1000*3600*24);  
	        return (int) between_days;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		return 1;
	}
	
	/**
	 * 计算系统当前时间和传入时间相差的时间(精确到秒)
	 * 如果结果大于零则当前系统时间大于传入的时间，小于零则相反
	 * @param date 传入的时间
	 * @return 返回相差的时间
	 */
	public static int secondBetween(String date){
		SimpleDateFormat sdfSecond = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			long presentDate = sdfSecond.parse(sdfSecond.format(new Date())).getTime();
			long enterDate = sdfSecond.parse(date).getTime();
			return (int) ((presentDate-enterDate)/1000);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	/**
	 * 计算系统当前时间和传入时间相差的时间(精确到秒)
	 * 如果结果大于零则当前系统时间大于传入的时间，小于零则相反
	 * @param date 传入的时间
	 * @return 返回相差的时间
	 */
	public static int secondBetween(Date date){
		if (date==null) {
			return 0;
		}
		SimpleDateFormat sdfSecond = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			long presentDate = sdfSecond.parse(sdfSecond.format(new Date())).getTime();
			long enterDate =  date.getTime();
			return (int) ((presentDate-enterDate)/1000);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	/**
	 * 计算过去时间，将date与当前系统时间进行对比
	 * @param date 要进行比较的时间，
	 * @return 返回时间类型的字符串
	 */
	public static String pastTime(Date date) {
		int second = secondBetween(date);
		if (second<60) {
			return second+"秒前";
		} else if (second>60 && second < 30*60) {
			return (second/60)+"分钟前";
		} else if (second>30*60 && second < 60*60) {
			return "半小时前";
		} else if (second>60*60 && second < 24*60*60) {
			return (second/60/60)+"小时前";
		} else {
			return DateUtil.dateFmtToString(date,"yyyy-MM-dd HH:mm:ss");
		}
		
		
	}
	
	/**
	 * 计算两个传入时间相差的时间(精确到秒)
	 * 如果结果大于零则传入的开始时间大于结束时间，小于零则相反
	 * @param beginDate 开始的时间
	 * @param endDate 结束时间
	 * @return 返回相差的时间
	 */
	public static int secondBetween(String beginDate,String endDate){
		SimpleDateFormat sdfSecond = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			long _enginDate = sdfSecond.parse(beginDate).getTime();
			long _endDate = sdfSecond.parse(endDate).getTime();
			return (int) ((_enginDate-_endDate)/1000);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}	
	
	/**
	 * 将开始时间与结束时间转换成时间格式,eg:2015-4-5至2015-3-2
	 * @param date 2015-4-5至2015-3-2
	 * @param split 至
	 * @param fmt 格式
	 * @return 返回日期，转换失败null
	 */
	public static Date[] beginEndStringToDate(String date,String split,String fmt) {
		if (StringUtil.isBlank(date) || StringUtil.isBlank(split)) {
			return null;
		}
		String[] _date = date.split(split);
		if (_date.length==2) {
			Date[] d = new Date[2];
			d[0] = DateUtil.stringFmtToDate(_date[0], fmt);
			d[1] = DateUtil.stringFmtToDate(_date[1], fmt);
			return d;
		}
		return null;
	}
	
	/**
	 * 将date转换为日历
	 * @param date　时间
	 * @return 返回Calendarl类型时间
	 */
	public static Calendar date2Calendar(Date date) {
		Calendar calendar = Calendar.getInstance(); //得到日历
		 calendar.setTime(date);
		return calendar;
	}
}