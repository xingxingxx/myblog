-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-06-02 12:38:08
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `bbs_reply`
--

CREATE TABLE IF NOT EXISTS `bbs_reply` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rtid` int(10) unsigned NOT NULL,
  `rsid` int(10) unsigned NOT NULL,
  `ruid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `reply_time` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_section`
--

CREATE TABLE IF NOT EXISTS `bbs_section` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `master_id` int(10) unsigned NOT NULL,
  `sign` varchar(255) NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `topic_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_topic`
--

CREATE TABLE IF NOT EXISTS `bbs_topic` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tsid` int(10) unsigned NOT NULL,
  `tuid` int(10) unsigned NOT NULL,
  `reply_count` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumb_img` char(38) NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_user`
--

CREATE TABLE IF NOT EXISTS `bbs_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` bit(1) NOT NULL DEFAULT b'0',
  `sign` varchar(255) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `last_login_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `reg_ip` int(10) unsigned NOT NULL,
  `last_login_ip` int(10) unsigned NOT NULL,
  `login` int(10) unsigned NOT NULL DEFAULT '0',
  `token` char(32) NOT NULL,
  `avatar` char(35) NOT NULL,
  `avatar_min` char(39) NOT NULL,
  `birthday` int(10) unsigned NOT NULL,
  `qq` char(10) NOT NULL,
  `mobile` char(11) NOT NULL,
  `province` mediumint(8) unsigned NOT NULL,
  `city` mediumint(8) unsigned NOT NULL,
  `district` mediumint(8) unsigned NOT NULL,
  `community` mediumint(8) unsigned NOT NULL,
  `address` varchar(80) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `bbs_user`
--

INSERT INTO `bbs_user` (`uid`, `username`, `password`, `email`, `sex`, `sign`, `reg_time`, `last_login_time`, `status`, `reg_ip`, `last_login_ip`, `login`, `token`, `avatar`, `avatar_min`, `birthday`, `qq`, `mobile`, `province`, `city`, `district`, `community`, `address`) VALUES
(38, 'xingxingxx', '6d465b01bcfb39bc2bd64d7e92bafafa', 'xx9815@qq.com', b'0', '', 1432805079, 1433215076, 1, 2130706433, 2130706433, 16, 'bfe5f7dca520c2822e54fc7731a6b7b0', '', '', 0, '', '', 0, 0, 0, 0, ''),
(39, '123456', '6d465b01bcfb39bc2bd64d7e92bafafa', 'xx9815@qq.com2', b'0', '', 1433150947, 0, 0, 2130706433, 0, 0, '07e124ee09ad062044492e1a6a04d8d0', '', '', 0, '', '', 0, 0, 0, 0, ''),
(40, '123456545', '2fece116f2c6786d904bb30e0c395307', 'xx9815@qq.com1', b'0', '', 1433153669, 0, 0, 2130706433, 0, 0, 'e3382cbf4faed31b294c66e9325fe731', '', '', 0, '', '', 0, 0, 0, 0, ''),
(41, '1234564', '8f497128c97e4b00f58c70752541d088', 'xx9815@qq.com5', b'0', '', 1433154511, 0, 0, 2130706433, 0, 0, 'e635e5c17650e4dcc5a9eacd207a5d3d', '', '', 0, '', '', 0, 0, 0, 0, ''),
(42, '12345645', 'bc2616950c84e95fd87a069a3d383fe4', 'xx9815@qq.com54', b'0', '', 1433154672, 0, 0, 2130706433, 0, 0, '252e871973ce5479ea4e7c689e0a21a7', '', '', 0, '', '', 0, 0, 0, 0, ''),
(43, '12345654', '06d82f493ce875a60d056e36e6242bfa', 'xx9815@qq.com22', b'0', '', 1433154918, 0, 0, 2130706433, 0, 0, '163727e13256b7232878be81d857d9cd', '', '', 0, '', '', 0, 0, 0, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
