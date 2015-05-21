-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-05-20 12:52:55
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
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `sex` bit(1) NOT NULL DEFAULT b'0',
  `sign` varchar(255) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `regip` char(15) DEFAULT NULL,
  `token` char(20) NOT NULL,
  `token_exptime` int(11) NOT NULL,
  `avatar` char(35) NOT NULL,
  `birthday` date NOT NULL,
  `qq` char(10) NOT NULL,
  `tel` char(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `community` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
