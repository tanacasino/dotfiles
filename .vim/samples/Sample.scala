package samples

/**
 * カラースキーマの色をチェックするときのためのソースコード
 */


import java.util.Date
import javax.inject.Inject

import scala.concurrent.Future
import scala.concurrent.{ ExecutionContext, Future }

sealed trait List[+A] {

  def foldLeft[B](z: B)(f: (B, A) => B): B = {
    @scala.annotation.tailrec
    def loop(list: List[A], acc)

  }

  def map[B](f: )
}

case class Cons[A](h: A, t: List[A]) extends List[A]

case object Nil extends List[Nothing]

abstract class Base




trait Fuga

trait Hoge {
  self => Fuga
}

sealed trait GitObject

case class Blob(content: Array[Byte]) extends GitObject

case class Tree(entries: Seq[String]) extends GitObject

case class Tag(name: String, message: String) extends GitObject

case class Commit(
  parents: Seq[Commit],
  tree: Tree,
  author: String,
  committer: String,
  message: String
) extends GitObject

class Git(gitDir: String) {

  type Ids = List[String]

  def show(branchName: String): Commit = ???


  /**
   * Ha Ha Ha
   */
  def getCommit(commitId: String): Commit = {
    val VAL = '1'
    var VAR = 1
    VAR = VAR * 10

    if(false || true && false) VAL.toInt else VAR

    val sss = """
    A 1
    B 2
    C 3
    D 4
    E 5
    """

    while(false) {
      println("hello")
    }

    List(1,2,4).foreach{ x =>
      println(x)
    }

    // TODO TODOコメント
    Option(1) match {
      case Some(value) => value.toString
      case None => "0"
    }

    throw new RunTimeException(s"${commitId} ですけど！")
  }

}


object GitRepository {

  def apply(gitDir: String): Git = ???

  def sha1ToHex(bytes: Array[Byte]): String = {
    bytes.map("%02x".format(_)).mkString
  }

}


object Main {

  def main(args: Array[String]): Unit = {
    val gitDir = args(0)
    GitRepository(gitDir)
  }

}

