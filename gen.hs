{-# LANGUAGE OverloadedStrings #-}
import Lucid
import Data.Monoid
import Data.Text (Text)


data PC = PC (Html ()) (Html ()) (Html ()) Text

pc = [
  PC "Nicolas Wu (Chair)" "University of Bristol" "UK" "http://zenzike.com/",
  PC "Kenichi Asai" "Ochanomizu University" "Japan" "http://www.is.ocha.ac.jp/~asai/",
  PC "Sandrine Blazy" "University of Rennes 1" "France" "http://www.irisa.fr/celtique/blazy/" ,
  PC "Carlos Camarao" "Universidade Federal de Minas Gerais" "Brazil" "http://homepages.dcc.ufmg.br/~camarao/",
  PC "Stephen Dolan" "University of Cambridge" "UK" "http://stedolan.net/",
  PC "Jurriaan Hage" "Utrecht University" "Netherlands" "http://foswiki.cs.uu.nl/foswiki/Hage/WebHome",
  PC "Yukiyoshi Kameyama" "University of Tsukuba" "Japan" "http://logic.cs.tsukuba.ac.jp/~kam/",
  PC "Benjamin Lerner" "Brown University" "USA" "http://cs.brown.edu/~blerner/",
  PC "Bas Lijnse" "Radboud University" "Netherlands" "http://www.cs.ru.nl/~baslijns/",
  PC "Garrett Morris" "University of Kansas" "USA" "http://homepages.inf.ed.ac.uk/jmorri14/",
  PC "Miguel Pagano" "Universidad Nacional de Córdoba" "Argentina" "https://cs.famaf.unc.edu.ar/~mpagano/",
  PC "Tomas Petricek" "Alan Turing Institute" "UK" "http://tomasp.net/",
  PC "Maciej Piróg" "University of Wrocław" "Poland" "http://www.ii.uni.wroc.pl/~mpirog/",
  PC "Exequiel Rivas" "Universidad Nacional de Rosario" "Argentina" "https://dcc.fceia.unr.edu.ar/~erivas/",
  PC "Neil Sculthorpe" "Nottingham Trent University" "UK" "http://neilsculthorpe.com/",
  PC "Melinda Tóth" "Eötvös Loránd University" "Hungary" "http://plcportal.inf.elte.hu/en/Pages/default.aspx",
  PC "Phil Trinder" "Glasgow University" "UK" "http://www.dcs.gla.ac.uk/~trinder/",
  PC "Kanae Tsushima" "National Institute of Informatics" "Japan" "http://www.nii.ac.jp/en/faculty/architecture/tsushima_kanae/",
  PC "Marcos Viera" "Universidad de la Republica" "Uruguay" "https://www.fing.edu.uy/",
  PC "Meng Wang" "University of Kent" "UK" "https://www.cs.kent.ac.uk/people/staff/mw516/"
 ]

mkLine :: PC -> Html ()
mkLine (PC name inst loc link)
  = tr_ $ td_ name <> td_ (a_ [href_ link] (inst <> ", " <> loc))

surrounding :: Html () -> Html ()
surrounding body = table_ [class_ "table"] body

main =
  renderToFile "prog-committee.html" (surrounding (mapM_ mkLine pc))

