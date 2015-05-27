-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-05-27 13:03:48
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
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sex` bit(1) NOT NULL DEFAULT b'0',
  `sign` varchar(255) NOT NULL,
  `regtime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `regip` char(15) NOT NULL,
  `token` char(32) NOT NULL,
  `token_exptime` int(11) NOT NULL,
  `avatar` char(35) NOT NULL,
  `birthday` int(11) NOT NULL,
  `qq` char(10) NOT NULL,
  `tel` char(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `community` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `bbs_user`
--

INSERT INTO `bbs_user` (`uid`, `username`, `password`, `email`, `sex`, `sign`, `regtime`, `status`, `regip`, `token`, `token_exptime`, `avatar`, `birthday`, `qq`, `tel`, `province`, `city`, `district`, `community`, `address`) VALUES
(33, '123456', '96e79218965eb72c92a549dd5a330112', 'xx9815@qq.com', b'0', '', 1432724031, 0, '2130706433', '41dcce8e42e2c81ea4abb7ec74a28b90', 1432810431, '', 0, '', '', 0, 0, 0, 0, ''),
(34, '1234567', '96e79218965eb72c92a549dd5a330112', 'xiao.xingping@163.com', b'0', '', 1432724066, 0, '2130706433', '248df3132d5b8cb34bfef0a784894b13', 1432810466, '', 0, '', '', 0, 0, 0, 0, ''),
(35, 'admin', '7fa8282ad93047a4d6fe6111c93b308a', 'xx9815@qq.com1', b'0', '', 1432724129, 0, '2130706433', '5980141cd4bcdec614d21222cfa38e1b', 1432810529, '', 0, '', '', 0, 0, 0, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
