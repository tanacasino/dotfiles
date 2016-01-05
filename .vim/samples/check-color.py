#!/usr/bin/env python
# -*- coding:utf-8 -*-
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

"""
vimのカラースキーマとフォントをチェックするためのテキトーコード.
"""
import sys


class Color(object):
    """Pydoc 的なやつ."""
    # FIXME デフォルトは無色が良いと思う.
    DEFAULT_COLOR = u"white"

    def __init__(self, name):
        """
        複数行のコメント.
        """
        if name is not None:
            if isinstance(name, unicode):
                self.name = name
            else:
                self.name = unicode(name, 'utf-8')
        else:
            self.name = Color.DEFAULT_COLOR

    def print_color(self):
        """80 width check --------------------------------------------------"""
        # TODO エンコード処理を入れないとリダイレクト時にエラーになる.
        print self.name


def main():
    """
    フォントの視認性チェック
    0O0|Il1
    01234567890
    abcdefghijklmnopqrstuvwxyz
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    !"#$%&'()-=^~\|@`[{;+:*]},<.>/?\_
    """
    print u"開始します。".encode("utf-8")
    print sys.version
    blue = Color(u'blue')
    blue.print_color()
    print u"終了します。".encode("utf-8")


if __name__ == '__main__':
    main()
