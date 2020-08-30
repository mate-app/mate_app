import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mateapp/widgets/widgets.dart';
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class VerwaltungPruefungsOrdnung extends StatefulWidget {
  @override
  _VerwaltungPruefungsOrdnungState createState() {
    return _VerwaltungPruefungsOrdnungState();
  }
}

class _VerwaltungPruefungsOrdnungState
    extends State<VerwaltungPruefungsOrdnung> {
  @override
  Widget build(BuildContext context) {
    const String _markdownData = '''NBl. MBW Schl.-H. 6/2012, S. 60
Tag der Bekanntmachung: 04. Oktober 2012
Prüfungsordnung (Satzung) für den Bachelorstudiengang Multimedia
Production am Fachbereich Medien der Fachhochschule Kiel
Aufgrund des § 52 Abs. 1 des Gesetzes über die Hochschulen und das Universitätsklinikum
Schleswig-Holstein (Hochschulgesetz - HSG) in der Fassung der Bekanntmachung vom 28.
Februar 2007 (GVOBl. Schl.-H. S. 184), zuletzt geändert durch Artikel 1 des Gesetzes zur
Änderung des Hochschulgesetzes und weiterer Rechtsvorschriften vom 4. Februar 2011
(GVOBl. Schl.-H. S. 34, ber. S. 67), wird nach Beschlussfassung durch den Konvent des
Fachbereichs Medien der Fachhochschule Kiel vom 17. April 2012 und mit Genehmigung des
Präsidiums der Fachhochschule Kiel vom 9. Mai 2012 folgende Satzung erlassen:
§ 1 Geltungsbereich und Hochschulgrad
(1) Die Prüfungsordnung bezieht sich auf die Prüfungsverfahrensordnung (PVO) der
Fachhochschule Kiel, in der jeweils gültigen Fassung. Sie regelt die
studiengangsspezifischen Verfahrensweisen.
(2) In diesem Studiengang verleiht die Hochschule aufgrund der bestandenen für den
Bachelor-Abschluss vorgesehenen Prüfung den akademischen Grad „Bachelor of Arts“,
abgekürzt „B.A.“.
§ 2 Zweck und Gliederung der Prüfung, Regelstudienzeit
(1) Die Prüfung zum Bachelor of Arts bildet den ersten berufsqualifizierenden
Studienabschluss. Durch die Prüfungen soll festgestellt werden, ob die Kandidatin oder
der Kandidat die für die Arbeit in dem Bereich Multimedia Production die notwendigen
gründlichen Fachkenntnisse und sonstigen Kompetenzen erworben hat, die
entsprechenden Instrumente beherrscht und die Fähigkeit besitzt, methodisch,
selbstständig und verantwortungsvoll auf wissenschaftlicher Grundlage zu arbeiten, um
mit anderen Personen im Unternehmen Problemlösungen im Bereich Multimedia
Production zu erarbeiten und umzusetzen.
(2) Die Zulassung erfolgt zum Wintersemester.
(3) Die Prüfungen erfolgen studienbegleitend und bestehen aus
a) den Prüfungen gemäß Anlage 1
b) der Bachelorthesis sowie
c) der mündlichen Abschlussprüfung (Kolloquium).
(4) Die Regelstudienzeit beträgt einschließlich aller Prüfungen, des berufspraktischen
Studienteils und der Bachelorthesis sieben Studienhalbjahre. Studienordnung, Angebot
und Umfang von Lehrveranstaltungen und Ablauf des Prüfungsverfahrens sind so zu
gestalten, dass die Regelstudienzeit eingehalten werden kann.
(5) Die gesamte Arbeitsbelastung einer / eines Studierenden für den Erwerb des BachelorGrades entspricht gemäß den Bestimmungen der Studienordnung 210 Leistungspunkten 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 2
nach dem ECTS.
§ 3 Bestehen der Prüfung
(1) Für die Bewertung von Prüfungen gelten die jeweils aktuelle Prüfungsverfahrensordnung
der Fachhochschule Kiel und die Regelungen des zweiten Abschnittes dieser Satzung.
(2) Die Prüfung zum Bachelor of Arts ist bestanden, wenn die in Anlage 1 geforderten
Leistungen in den Lehr- und Praxismodulen sowie die Bachelorthesis und das Kolloquium
mit mindestens „ausreichend“ bewertet worden sind.
(3) Die Gesamtnote der Prüfung zum Bachelor of Arts wird aus dem mit den
Leistungspunktewerten aller Prüfungen nach ECTS, wie sie sich gemäß Anlage 1
ergeben, gewogenen Mittel der Noten der Module, der Thesis und des Kolloquiums
berechnet.
§ 4 Prüfungsausschuss
(1) Der Prüfungsausschuss besteht aus bis zu sechs Mitgliedern.
(2) Der Fachbereichskonvent wählt die Vorsitzende oder den Vorsitzenden, eine
stellvertretende Vorsitzende oder einen stellvertretenden Vorsitzenden sowie ein
weiteres Mitglied des Prüfungsausschusses jeweils aus der Mitgliedergruppe der
Professorinnen und Professoren und je ein Mitglied aus den Hochschulmitgliedergruppen
des wissenschaftlichen Dienstes, des nichtwissenschaftlichen Dienstes und der
Studierenden. Steht kein Mitglied aus der Mitgliedergruppe des wissenschaftlichen oder
des nichtwissenschaftlichen Dienstes zur Wahl, so bleibt der jeweilige Sitz unbesetzt. Für
jedes Mitglied ist ein stellvertretendes Mitglied aus der entsprechenden Mitgliedergruppe
zu wählen. Die Wahlzeit für Studierende beträgt ein Jahr, für die übrigen Mitglieder und
die stellvertretenden Mitglieder drei Jahre. Eine Wiederwahl der Mitglieder und
stellvertretenden Mitglieder des Prüfungsausschusses ist zulässig.
(3) Der Prüfungsausschuss ist beschlussfähig, wenn neben der oder dem Vorsitzenden oder
stellvertretenden Vorsitzenden und einem weiteren Mitglied aus der Mitgliedergruppe der
Professorinnen und Professoren ein weiteres stimmberechtigtes Mitglied anwesend ist. Er
beschließt mit einfacher Mehrheit. Bei Stimmengleichheit entscheidet die Stimme der
oder des Vorsitzenden. Vertreterinnen oder Vertreter der Mitgliedergruppe der
Studierenden sind bei der Behandlung zukünftiger Prüfungsaufgaben auszuschließen. In
eilbedürftigen Angelegenheiten kann nach vorheriger Information in Textform eine
Entscheidung des Prüfungsausschusses auch fernmündlich oder in Textform seitens der
Vorsitzenden oder des Vorsitzenden des Prüfungsausschusses eingeholt werden. Ist auf
diesem Wege keine einstimmige Entscheidung zu erreichen, gilt der Beschluss als nicht
gefasst.
(4) Die oder der Vorsitzende des Prüfungsausschusses achtet darauf, dass die
Bestimmungen dieser Prüfungsordnung eingehalten werden, und trifft alle
Entscheidungen, die den organisatorischen Ablauf der Prüfungen betreffen. Sie oder er
berichtet regelmäßig dem Konvent über die Entwicklung der Prüfungen und der
Studienzeiten und gibt Anregungen zur Reform der Studienordnung und der
Prüfungsordnung.
§ 5 Module 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 3
Module werden mit einer Prüfung abgeschlossen. Ein Modul stellt eine in sich inhaltlich
abgeschlossene Lerneinheit dar, die sich in der Regel auf ein Studienhalbjahr erstreckt.
§ 6 Form und Dauer der Leistungen, Prüfungssprache
(1) Die zum Abschluss des Studiums führenden Prüfungen werden studienbegleitend
abgenommen, d. h. die Kandidatin oder der Kandidat soll die einzelnen Leistungen in
den dafür vorgesehenen Studienhalbjahren erbringen.
(2) Jedes Modul endet mit einer Prüfung. Die Prüfungsformen gemäß PVO der
Fachhochschule Kiel werden für alle Module zu Beginn der Vorlesungen bekannt
gegeben. Wird diese nicht festgelegt, dann endet das entsprechende Modul mit einer
Klausur von 2 Stunden.
(3) Die Erstprüferin oder der Erstprüfer legt die Prüfungssprache fest (Englisch oder
Deutsch).
§ 7 Bewertung von Leistungen
(1) Leistungen werden von den Prüferinnen oder den Prüfern bewertet, in deren oder dessen
Lehrveranstaltung die Leistungen zu erbringen sind. Im Falle von Zweitbewertungen
gem. § 51 Abs. 4 HSG bestimmt der oder die Vorsitzende des Prüfungsausschusses die
Zweitprüferin oder den Zweitprüfer. Können sich beide Prüfer/innen nicht auf eine
gemeinsame Bewertung einigen, wird die Leistung mit dem rechnerischen Mittelwert der
Einzelbewertungen berücksichtigt. Weichen die Einzelbewertungen um mehr als eine
ganze Note voneinander ab oder wurde eine Bewertung mit der Note „5“ abgegeben,
entscheidet der Prüfungsausschuss. Arbeiten von Gruppen können auch mit einer
einheitlichen Note für alle Kandidatinnen und Kandidaten bewertet werden. Dies bedarf
einer schriftlichen Einverständniserklärung der Kandidatinnen und Kandidaten.
(2) Für das erfolgreiche Bestehen eines Moduls können Mindestvoraussetzungen hinsichtlich
der Ergebnisse in den Teilprüfungen festgelegt werden.
(3) Das Bewertungsverfahren soll vier Wochen nicht überschreiten.
(4) Eine Prüfung ist bestanden, wenn sich unter Anwendung der Prüfungsverfahrensordnung
der Fachhochschule Kiel mindestens die Note ausreichend (4,0) ergibt.
(5) Richtet sich ein Widerspruch gegen die Bewertung einer Prüfung oder der Thesis, so ist
von der oder dem Vorsitzenden des Prüfungsausschusses eine zweite Bewertung
einzuholen, sofern nicht ohnehin eine Zweitbewertung stattgefunden hat.
§ 8 Meldung und Zulassung
(1) Die Anmeldung zur Prüfung ist in dem vom Prüfungsamt vorgegebenen Zeitraum zur
Anmeldung vor der Prüfung schriftlich oder elektronisch über die von der Hochschule zur
Verfügung gestellte Internetplattform vorzunehmen. Die Vorsitzende bzw. der
Vorsitzende des Prüfungsausschusses kann kürzere Fristen und Erleichterungen in der
Form festlegen.
(2) Voraussetzungen für die Zulassung zu den Prüfungen sind:
a) die Einschreibung an der Fachhochschule Kiel in dem jeweiligen Studiengang, ohne
dass zum Zeitpunkt des Eingangs der Anmeldung eine Beurlaubung vom Studium
oder eine Unterbrechung des Studiums vorliegt, 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 4
b) eine form- und fristgerechte Anmeldung zur Teilnahme an der jeweiligen Prüfung und
c) gegebenenfalls der Nachweis der nach der Prüfungsordnung für den jeweiligen
Studiengang zu erbringenden Vorleistungen,
d) für die Zulassung zum Kolloquium eine mit mindestens „ausreichend“ bewertete
Thesis in dem jeweiligen Studiengang.
(3) Die Zulassung zum Kolloquium wird erteilt, wenn eine Thesis mit mindestens
„ausreichend“ bestanden ist und sämtliche anderen Leistungen des Studiengangs
erfolgreich bestanden oder anerkannt wurden. Das Kolloquium soll die letzte zu
erbringende Leistung sein. Ausnahmen hiervon kann der oder die Vorsitzende des
Prüfungsausschusses im begründeten Einzelfall machen.
(4) Liegen die als Voraussetzung für eine Prüfung erforderlichen Leistungen nicht vor, kann
eine vorläufige Zulassung ausgesprochen werden. Die Nachweise für diese
Studienleistungen sind spätestens bis zum Beginn der Prüfung dem Prüfungsamt
vorzulegen; ansonsten gilt die Kandidatin oder der Kandidat als nicht zugelassen.
§ 9 Prüfungstermine und Orte
(1) Die oder der Vorsitzende des Prüfungsausschusses soll die Prüfungen im
Bachelorstudiengang so organisieren, dass ein Prüfungszeitraum jeweils am Ende eines
Studienhalbjahres in der Vorlesungszeit stattfindet. Ist die Prüfungsform eine Projektoder Hausarbeit, kann die oder der Prüfungsausschussvorsitzende Abweichungen
genehmigen. Nichtbestandene Prüfungen können im Prüfungszeitraum zu Beginn der
Vorlesungszeit des folgenden Semesters wiederholt werden. Ist die Unterrichtseinheit in
Blockform zusammengefasst, so können Prüfungen im Laufe des Semesters am Ende
der jeweiligen Unterrichtseinheit eines Modulfaches abgenommen werden.
(2) Für die Bachelorthesis sowie die Kolloquien ist mindestens ein Termin pro
Studienhalbjahr anzusetzen.
(3) Der vorgesehene Zeitraum für Prüfungen sowie die Meldetermine sollen jeweils
mindestens drei Monate vorher bekannt gegeben werden.
§ 10 Wiederholung von Prüfungen
(1) Nicht bestandene Prüfungsleistungen können grundsätzlich einmal wiederholt werden.
Der Prüfungsausschuss kann in begründeten Fällen auf Antrag eine zweite
Wiederholungsprüfung zulassen.
(2) Sind in einer nichtbestandenen Prüfung mindestens 80 % der zum Bestehen geforderten
Leistung erbracht worden, kann die Note durch eine mündliche Nachprüfung auf die Note
„ausreichend“ angehoben werden.
(3) Teile einer Prüfung können nicht einzeln wiederholt werden.
(4) Ist eine Bachelorthesis mit „nicht ausreichend“ bewertet worden, kann die Anfertigung
der Bachelorthesis nur einmal wiederholt werden. Diese Regelung gilt für die Kolloquien
entsprechend.
§ 11 Thesis 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 5
(1) Eine Prüferin oder ein Prüfer stellt das Thema der Thesis.
(2) Die Bearbeitungszeit für eine Bachelorthesis beträgt 2 Monate. Auf einen vor Ablauf der
Frist gestellten schriftlichen Antrag der Kandidatin oder des Kandidaten kann die
Vorsitzende oder der Vorsitzende des Prüfungsausschusses die Bearbeitungszeit um bis
zu einen Monat verlängern, wenn der Abgabetermin aus triftigen Gründen, die die
Kandidatin oder der Kandidat nicht zu vertreten hat, nicht eingehalten werden kann.
(3) Zusammen mit den drei Exemplaren der Thesis in gedruckter und gebundener Form ist
ein mit Standardsoftware lesbarer Datenträger abzugeben, auf dem sich Text- und
Mediendateien in der Abschlussarbeit befinden. Diese müssen durch gängige
Textverarbeitungssysteme les- und bearbeitbar sein.
(4) Die Thesis wird von zwei Prüfungsberechtigten bewertet.
§ 12 Inkrafttreten
Diese Prüfungsordnung tritt mit Wirkung vom 1. September 2012 in Kraft. Sie gilt erstmals
für die Studierenden, die im Wintersemester 2012/13 ein Studium im Bachelorstudiengang
Multimedia Production am Fachbereich Medien der Fachhochschule Kiel aufnehmen.
Kiel, den 4. Juli 2012
Fachhochschule Kiel
Fachbereich Medien
Prof. Dr. Bernd Vesper
Der Dekan
 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 6
Anlage 1 zur Prüfungsordnung: Prüfungen des Bachelorabschlusses
Multimedia Production
Gemeinsame Module 1. – 6. Semester
Modulbezeichnung Studienhalbjahr
Prüfungsform/
-dauer 1)
Gewicht für
Gesamtnote/
210 2)
Rhetorik und mediengerechtes
Schreiben
1 siehe § 6, Abs. 2 5
Grundlagen Medientechnik 1 siehe § 6, Abs. 2 5
Medienwissenschaft 1 siehe § 6, Abs. 2 10
Grundlagen der Gestaltung 1 siehe § 6, Abs. 2 5
Grundlagen IT 1 siehe § 6, Abs. 2 5
Audio-/ Videoproduktion 1 2 siehe § 6, Abs. 2 5
Postproduktion 2 siehe § 6, Abs. 2 5
Medienrecht 2 siehe § 6, Abs. 2 5
Visuelle Medien 2 siehe § 6, Abs. 2 10
Grundlagen der
Webseitenerstellung
2 siehe § 6, Abs. 2 5
Audio-/ Videoproduktion 2 3 siehe § 6, Abs. 2 5
Animation 3 siehe § 6, Abs. 2 5
Medienwirtschaft 3 siehe § 6, Abs. 2 5
Absatzwirtschaft und
Marktkommunikation
3 siehe § 6, Abs. 2 5
Dynamische
Webseitengestaltung
3 siehe § 6, Abs. 2 10
Compositing 4 siehe § 6, Abs. 2 5
Echtzeitanwendungen im
Internet
4 siehe § 6, Abs. 2 5
Mediennutzungs- und
Rezeptionsforschung
5 siehe § 6, Abs. 2 5
Medienethik 6 siehe § 6, Abs. 2 5
Management und
Unternehmensführung
6 siehe § 6, Abs. 2 5
 
Prüfungsordnung Bachelorstudiengang Multimedia Production Seite 7
Studienschwerpunkt ab 4. Semester: Audiovisuelle Medien
Modulbezeichnung Studienhalbjahr
Prüfungsform/
-dauer 1)
Gewicht für
Gesamtnote/
210 2)
Public Relations 4 siehe § 6, Abs. 2 10
AV Nachrichtenmedien 4 siehe § 6, Abs. 2 10
Synergetische
Publikationsmethoden
5 siehe § 6, Abs. 2 10
Wahlpflichtmodul 5 siehe § 6, Abs. 2 5
Kurzfilm 5 siehe § 6, Abs. 2 5
Corporate Video in der
Öffentlichkeitsarbeit
5 siehe § 6, Abs. 2 5
Medienprojekt 6 Projekt 10
Wahlpflichtmodul 6 siehe § 6, Abs. 2 10
Bachelorthesis 7 Projekt 12
Kolloquium 7 mündliche Prüfung 3
Projekt im Unternehmen 7 Projekt 10
Wahlpflichtmodul 7 siehe § 6, Abs. 2 5
Studienschwerpunkt ab 4. Semester: Interaktive Medien
Modulbezeichnung Studienhalbjahr
Prüfungsform/
-dauer 1)
Gewicht für
Gesamtnote/
210 2)
Mobile Anwendungen 4 siehe § 6, Abs. 2 5
3D Produktion 4 siehe § 6, Abs. 2 10
Technik immersiver
Präsentation
4 siehe § 6, Abs. 2 5
Interaktive Anwendungen 5 siehe § 6, Abs. 2 10
Wahlpflichtmodul 5 siehe § 6, Abs. 2 5
Business Anwendungen 5 siehe § 6, Abs. 2 5
VR-Anwendungen 5 siehe § 6, Abs. 2 5
Medienprojekt 6 Projekt 10
Wahlpflichtmodul 6 siehe § 6, Abs. 2 10
Bachelorthesis 7 Projekt 12
Kolloquium 7 mündliche Prüfung 3
Projekt im Unternehmen 7 Projekt 10
Wahlpflichtmodul 7 siehe § 6, Abs. 2 5
1) Siehe § 6, Abs. 2
2) Gewichtung nach ECTS-Leistungspunkten 
''';
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Prüfungsordnung'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ExaminationRegulationText(
              text: _markdownData,
            ),
          ])),
        ],
      ),
    );
  }
}

class ExaminationRegulationText extends StatelessWidget {
  final String text;

  //Constructor

  ExaminationRegulationText({
    Key key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
              child: MarkdownBody(data: text)),
          // // Comment until Website Ready
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          //     child: CupertinoButton(
          //       padding: EdgeInsets.zero,
          //       child: Text('zur Webseite'),
          //       onPressed: () => launchURL('www.mate-app.de/datenschutz'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
