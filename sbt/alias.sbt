// Eclipse(Scala IDE)用の設定ファイルを出力
//addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "4.0.0")

addCommandAlias("c", "compile")

addCommandAlias("cc", "~compile")

addCommandAlias("tc", "test:compile")

addCommandAlias("tcc", "~test:compile")

addCommandAlias("tq", "testQuick")

addCommandAlias("tqc", "~testQuick")

addCommandAlias("f", "scalariformFormat")

addCommandAlias("tf", "test:scalariformFormat")

