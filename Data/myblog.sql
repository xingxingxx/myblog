-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-05-28 12:44:56
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
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rtid` int(11) NOT NULL,
  `rsid` int(11) NOT NULL,
  `ruid` int(11) NOT NULL,
  `content` text NOT NULL,
  `reply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `click` int(11) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_section`
--

CREATE TABLE IF NOT EXISTS `bbs_section` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `master_id` int(11) NOT NULL,
  `statement` varchar(255) NOT NULL,
  `click` int(11) NOT NULL,
  `topic_count` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_topic`
--

CREATE TABLE IF NOT EXISTS `bbs_topic` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tsid` int(11) NOT NULL,
  `tuid` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `click` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `bbs_user`
--

CREATE TABLE IF NOT EXISTS `bbs_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` bit(1) NOT NULL DEFAULT b'0',
  `sign` varchar(255) NOT NULL,
  `reg_time` int(11) NOT NULL,
  `last_login_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `reg_ip` bigint(20) NOT NULL,
  `last_login_ip` bigint(20) NOT NULL,
  `login` int(11) NOT NULL DEFAULT '0',
  `token` char(32) NOT NULL,
  `avatar` char(35) NOT NULL,
  `birthday` int(11) NOT NULL,
  `qq` char(10) NOT NULL,
  `mobile` char(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `community` int(11) NOT NULL,
  `address` varchar(80) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `bbs_user`
--

INSERT INTO `bbs_user` (`uid`, `username`, `password`, `email`, `sex`, `sign`, `reg_time`, `last_login_time`, `status`, `reg_ip`, `last_login_ip`, `login`, `token`, `avatar`, `birthday`, `qq`, `mobile`, `province`, `city`, `district`, `community`, `address`) VALUES
(38, 'xingxingxx', '6d465b01bcfb39bc2bd64d7e92bafafa', 'xx9815@qq.com', b'0', '', 1432805079, 1432808262, 1, 2130706433, 2130706433, 6, 'bfe5f7dca520c2822e54fc7731a6b7b0', '', 0, '', '', 0, 0, 0, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
