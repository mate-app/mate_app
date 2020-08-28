import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:markdown/markdown.dart' as md;
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class EinstellungDatenschutz extends StatefulWidget {
  @override
  _EinstellungDatenschutzState createState() {
    return _EinstellungDatenschutzState();
  }
}

class _EinstellungDatenschutzState extends State<EinstellungDatenschutz> {
  @override
  Widget build(BuildContext context) {
    const String _markdownData =
        '''Wir begrüßen dich bei unserer App und freuen uns über dein Interesse. Der Schutz deiner personenbezogenen Daten ist uns ein wichtiges Anliegen. Deshalb betreiben wir unsere Aktivitäten in Übereinstimmung mit den anwendbaren Rechtsvorschriften zum Schutz  von personenbezogenen Daten und zur Datensicherheit. Wir möchten dich nachfolgend darüber informieren, welche Daten deines Besuchs zu welchen Zwecken verwendet werden.


## **I.** **Name und Anschrift des Verantwortlichen**
Verantwortlicher im Sinne der Datenschutz-Grundverordnung und anderer nationaler Datenschutzgesetze der Mitgliedsstaaten sowie sonstiger datenschutzrechtlicher Bestimmungen ist die:

Anschrift
Telefonnummer
E-Mail
Website

**II.** **Allgemeines zur Datenverarbeitung**
**1. Umfang der Verarbeitung personenbezogener Daten**
Wir verarbeiten personenbezogene Daten unserer Nutzer*innen grundsätzlich nur, soweit dies zur Bereitstellung einer funktionsfähigen mobilen App sowie unserer Inhalte und Leistungen erforderlich ist. Die Verarbeitung personenbezogener Daten unserer Nutzer*innen erfolgt regelmäßig nur nach Einwilligung der jeweiligen Nutzer*innen. Eine Ausnahme gilt in solchen Fällen, in denen eine vorherige Einholung einer Einwilligung aus tatsächlichen Gründen nicht möglich ist und die Verarbeitung der Daten durch gesetzliche Vorschriften gestattet ist.
Alle von uns erhobenen Daten werden ausschließlich über SSL-verschlüsselte Verbindungen übertragen.

**2. Rechtsgrundlage für die Verarbeitung personenbezogener Daten**
Soweit wir für Verarbeitungsvorgänge personenbezogener Daten eine Einwilligung der betroffenen Person einholen, dient Art. 6 Abs. 1 lit. a EU-Datenschutzgrundverordnung (DSGVO) als Rechtsgrundlage.
Bei der Verarbeitung von personenbezogenen Daten, die zur Erfüllung eines Vertrages, dessen Vertragspartei die betroffene Person ist, erforderlich ist, dient Art. 6 Abs. 1 lit. b DSGVO als Rechtsgrundlage. Dies gilt auch für Verarbeitungsvorgänge, die zur Durchführung vorvertraglicher Maßnahmen erforderlich sind.
Soweit eine Verarbeitung personenbezogener Daten zur Erfüllung einer rechtlichen Verpflichtung erforderlich ist, der unser Unternehmen unterliegt, dient Art. 6 Abs. 1 lit. c DSGVO als Rechtsgrundlage.
Für den Fall, dass lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen Person eine Verarbeitung personenbezogener Daten erforderlich machen, dient Art. 6 Abs. 1 lit. d DSGVO als Rechtsgrundlage.
Ist die Verarbeitung zur Wahrung eines berechtigten Interesses unseres Unternehmens oder eines Dritten erforderlich und überwiegen die Interessen, Grundrechte und Grundfreiheiten des Betroffenen das erstgenannte Interesse nicht, so dient Art. 6 Abs. 1 lit. f DSGVO als Rechtsgrundlage für die Verarbeitung.

**3. Datenlöschung und Speicherdauer**
Die personenbezogenen Daten der betroffenen Person werden gelöscht oder gesperrt, sobald der Zweck der Speicherung entfällt. Eine Speicherung kann darüber hinaus erfolgen, wenn dies durch den europäischen oder nationalen Gesetzgeber in unionsrechtlichen Verordnungen, Gesetzen oder sonstigen Vorschriften, denen der Verantwortliche unterliegt, vorgesehen wurde. Eine Sperrung oder Löschung der Daten erfolgt auch dann, wenn eine durch die genannten Normen vorgeschriebene Speicherfrist abläuft, es sei denn, dass eine Erforderlichkeit zur weiteren Speicherung der Daten für einen Vertragsabschluss oder eine Vertragserfüllung besteht.


**III. Verarbeitung von Identifikationsdaten des Nutzers aus dem Universitätsnetzwerk**
**1. Beschreibung und Umfang der Datenverarbeitung**
Bei der Registrierung in der App werden von Nutzer*innen über Auswahlfelder personenbezogene Daten an uns übermittelt. Diese Daten beinhalten besuchte Bildungseinrichtung, Fachbereich, Studiengang, Fachsemester und Sprache.
Außerdem gibt der*die Nutzer*in bei der Registrierung die Identifikationsdaten, die für die Anmeldung im Universitätsnetzwerk notwendig sind, an. E-Mail Adresse und Passwort der Nutzerin / des Nutzers / * werden verwendet, um die Legitimität der Identifikationsdaten durch Anmeldung im Universitätsnetzwerk zu überprüfen. Nach erfolgreicher Anmeldung werden die Daten besuchte Bildungseinrichtung, Fachbereich, Studiengang, Fachsemester, Sprache und E-Mail Adresse der Nutzerin / des Nutzers / * mit einer eindeutigen User-ID verknüpft und gespeichert. Das Passwort der Nutzerin / des Nutzers / * wird nach ISO verschlüsselt und ist für uns uneinsehbar.
Auf dem Endgerät der Nutzerin / des Nutzers / * werden weiterhin bei der Registrierung E-Mail Adresse und Passwort lokal gespeichert, die nicht an uns übermittelt werden. 
In der App gibt es ein Bewertungssystem für die Mensagerichte. Es werden die positiven und negativen Bewertungen von Gerichten der Nutzerin / des Nutzers / * gespeichert und mit ihrer*seiner eindeutigen User-ID verknüpft. Die positiven und negativen Bewertungen aller Nutzer*innen werden zusammengerechnet und als eine nicht zurückverfolgbare Zahl und für jede*n Nutzer*in sichtbar in der App dargestellt.

**2. 	Rechtsgrundlage für die Datenverarbeitung**
Rechtsgrundlage für die bei der Registrierung erhobenen personenbezogenen Daten und Identifikationsdaten ist deine Einwilligung (Art. 6 Abs. 1 lit. a DSGVO).

**3. Zweck der Datenverarbeitung**
Die personenbezogenen Daten werden von uns verarbeitet, um eine individuelle Funktionsweise der App zu ermöglichen. So ist beispielsweise die besuchte Bildungseinrichtung relevant, um nur Semesterpläne und Mensapläne, die den*die Nutzer*in betreffen, anzuzeigen.
Die Identifikationsdaten der Nutzerin / des Nutzers / * dienen uns, um plattformübergreifenden, individuellen Service anzubieten und von verschiedenen Endgeräten auf die in der App zur Verfügung gestellten Informationen zuzugreifen.
Die lokale Speicherung von E-Mail Adresse und Passwort wird zur Authentifizierung im Universitätsnetzwerk zum Abruf von für den konkreten Nutzer relevanten Prüfungsinformationen der Kurse verwendet. 
Die Bewertungsdaten der Mensagerichte werden gespeichert um den Nutzer*innen ein Stimmungsbild über die Beliebtheit der Mensagerichte des heutigen Tages bieten zu können.
**4. Dauer der Speicherung**
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Nach einem Jahr der Nichtnutzung unserer App werden automatisiert alle an uns übermittelten personenbezogenen Daten und Identifikationsdaten gelöscht.
**5. Widerspruchs- und Beseitigungsmöglichkeit**
Der*die Nutzer*in hat jederzeit die Möglichkeit, seine*ihre Einwilligung zur Verarbeitung der personenbezogen Daten und Identifikationsdaten zu widerrufen. Der Widerruf der Einwilligungserklärung erfolgt durch Mitteilung an die Verantwortlichen per E-Mail.

**IV.**        	**Verarbeitung von personenbezogenen Daten aus dem Universitätsnetzwerk**
**1. 	Beschreibung und Umfang der Datenverarbeitung**
Einmalig nach der Registrierung und Login in der App und danach nur auf manuelle Anfrage der Nutzerin / des Nutzers / * werden mithilfe der lokal gespeicherten Identifikationsdaten folgende im Universitätsnetzwerk hinterlegte personenbezogenen Daten an uns übermittelt und mit der Identifikationsnummer der Nutzerin / des Nutzers / * verknüpft:
(1)  Studienfächer   
(2) Creditpoints
(3)  Noten und bestandene / nicht bestandene Prüfungen.
Die Verarbeitung der Daten erfolgt ausschließlich zum Zweck ihrer Erhebung. Es erfolgt keinesfalls eine Weitergabe an Dritte. Weitere im Universitätsnetzwerk gespeicherte personenbezogene Daten wie z.B. der Wohnort des Nutzers werden von uns in keinem Fall verarbeitet.
**2. Rechtsgrundlage für die Datenverarbeitung**
Rechtsgrundlage für die bei der Anmeldung erhobenen Identifikationsdaten ist deine Einwilligung (Art. 6 Abs. 1 lit. a DSGVO).
**3. Zweck der Datenverarbeitung**
Wir nutzen deine Daten, um die Funktioalität der App, den Nutzer*innen eine Übersicht hinsichtlich aller für den Universitätsalltag relevanten Informationen in Form einer einzigen Applikation zur Verfügung zu stellen, bereitzustellen.
**4. Dauer der Speicherung**
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Nach einem Jahr der Nichtnutzung unserer App werden automatisiert alle an uns übermittelten personenbezogenen Daten gelöscht.
**5. Widerspruchs- und Beseitigungsmöglichkeit**
Der*die Nutzer*in hat jederzeit die Möglichkeit, seine*ihre Einwilligung zur Verarbeitung der Identifikationsdaten zu widerrufen. Der Widerruf der Einwilligungserklärung erfolgt durch Mitteilung an den Verantwortlichen per E-Mail.
**V.**                **Newsletterfunktion**
**1. Beschreibung und Umfang der Datenverarbeitung**
Auf unserer Internetseite besteht die Möglichkeit, einen kostenfreien Newsletter zu abonnieren. Bei der Anmeldung zum Newsletter werden die Daten aus der jeweiligen Eingabemaske an uns übermittelt. Diese beinhalten nur deine E-Mail Adresse. Wir nutzen deine E-Mail Adresse, um dir in der Regel in monatlichen Abständen Updates zuzusenden.
Die Anmeldung zu unserem Newsletter erfolgt in einem sog. Double-Opt-In-Verfahren. D.h. du erhältst nach der Anmeldung eine E-Mail, in der du um die Bestätigung deiner Anmeldung gebeten wirst. Diese Bestätigung ist notwendig, damit sich niemand mit fremden E-Mail Adressen anmelden kann.
Bei der Anmeldung zum Newsletter werden die IP-Adresse der Nutzerin / des Nutzers / * sowie Datum und Uhrzeit der Registrierung gespeichert. Dies dient dazu, einen Missbrauch der Dienste oder der E-Mail-Adresse der betroffenen Person zu verhindern. Eine Weitergabe der Daten an Dritte erfolgt nicht. Eine Ausnahme besteht dann, wenn eine gesetzliche Verpflichtung zur Weitergabe besteht.
**2. Rechtsgrundlage für die Datenverarbeitung**
Die bei der Newsletteranmeldung erhobenen Daten werden ausschließlich auf Grundlage deiner Einwilligung (Art. 6 Abs. 1 lit. a DSGVO) verarbeitet.
**3. Zweck der Datenverarbeitung**
Wir nutzen deine E-Mail Adresse, um dir Updates zuzusenden.
**4. Dauer der Speicherung**
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Die E-Mail-Adresse des Nutzers wird demnach solange gespeichert, wie das Abonnement des Newsletters aktiv ist. Die sonstigen im Rahmen des Anmeldevorgangs erhobenen personenbezogenen Daten werden in der Regel nach einer Frist von sieben Tagen gelöscht.
**5. Widerspruchs- und Beseitigungsmöglichkeit**
Das Abonnement des Newsletters kann durch den*die betroffenen Nutzer*in jederzeit gekündigt werden. Zu diesem Zweck findet sich in jedem Newsletter ein entsprechender Link. Hierdurch wird ebenfalls ein Widerruf der Einwilligung der Speicherung der während des Anmeldevorgangs erhobenen personenbezogenen Daten ermöglicht.
**VI.**              **Kontaktformular und E-Mail Kontakt**
**1. Beschreibung und Umfang der Datenverarbeitung**
Auf unserer Website ist ein Kontaktformular vorhanden, welches für die elektronische Kontaktaufnahme genutzt werden kann. Nimmt ein*e Nutzer*in diese Möglichkeit wahr, so werden die in der Eingabemaske eingegebenen Daten an uns übermittelt. Diese Daten sind mindestens die E-Mail Adresse sowie ein Name.
Im Rahmen der Kontaktaufnahme über das Formular nutzen wir auch die reCAPTCHA Funktion von Google Ireland Limited, Gordon House, 4 Barrow St, Dublin, D04 E5W5, Irland („Google“). Dabei werden durch den Dienst Informationen wie die IP-Adresse der Nutzerin / des Nutzers / *, eingestellter Sprache des Browsers, durch den*die Nutzer*in getätigte Mausbewegungen und ggf. weitere für den Dienst benötigter Daten an Google übermittelt. Im Rahmen der Nutzung von Google reCAPTCHA kann es auch zu einer Übermittlung von personenbezogenen Daten an die Server der Google LLC. in den USA kommen. Der reCAPTCHA Dienst läuft vollständig im Hintergrund. Nutzer des Kontaktformulars werden nicht darauf hingewiesen, dass eine Analyse stattfindet. 
Zum Zeitpunkt der Absendung der Nachricht werden zudem folgende Daten gespeichert:
(1)  Die IP-Adresse des Nutzers
(2)  Datum und Uhrzeit der Registrierung
Für die Verarbeitung der Daten wird im Rahmen des Absendevorgangs deine Einwilligung eingeholt und auf diese Datenschutzerklärung verwiesen.
Alternativ ist eine Kontaktaufnahme über die auf unserer Website und in unserer App bereitgestellte E-Mail-Adresse möglich. In diesem Fall werden die mit der E-Mail übermittelten personenbezogenen Daten der Nutzerin / des Nutzers / *gespeichert.
Es erfolgt in diesem Zusammenhang keine Weitergabe der Daten an Dritte. Die Daten werden ausschließlich für die Verarbeitung der Anfrage verwendet.
**2. Rechtsgrundlage für die Datenverarbeitung**
Rechtsgrundlage für die Verarbeitung der Daten ist bei Vorliegen einer Einwilligung des Nutzers Art. 6 Abs. 1 lit. a DSGVO.
Rechtsgrundlage für die Verarbeitung der Daten, die im Zuge einer Übersendung einer E-Mail übermittelt werden, ist Art. 6 Abs. 1 lit. f DSGVO.
Rechtsgrundlage für die Übermittlung von Daten an Google durch Nutzung des Dienstes reCAPTCHA ist Art. 6 Abs. 1 lit. f DSVGO. 
**3. Zweck der Datenverarbeitung**
Die Verarbeitung der personenbezogenen Daten aus der Eingabemaske dient uns allein zur Bearbeitung der Kontaktaufnahme. Im Falle einer Kontaktaufnahme per E-Mail liegt hieran auch das erforderliche berechtigte Interesse an der Verarbeitung der Daten.
Die Verwendung der reCAPTCHA Funktion dient dazu, einen Missbrauch des Kontaktformulars zu verhindern, indem eine Unterscheidung zwischen der Eingabe durch eine natürliche Person und der missbräuchlichen Eingabe durch automatisierte Verarbeitung ermöglicht wird. Die Vermeidung von Missbrauch und Spam ist dabei die Basis unseres berechtigten Interesses. Weitere Informationen zum Dienst Google reCAPTCHA kannst du der Datenschutzerklärung von Google unter [ https://www.google.com/intl/de/policies/privacy/](https://www.google.com/intl/de/policies/privacy/)  entnehmen.
**4. Dauer der Speicherung**
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Für die personenbezogenen Daten aus der Eingabemaske des Kontaktformulars und diejenigen, die per E-Mail übersandt wurden, ist dies dann der Fall, wenn die jeweilige Konversation mit dem*der Nutzer*in beendet ist. Beendet ist die Konversation dann, wenn sich aus den Umständen entnehmen lässt, dass der betroffene Sachverhalt abschließend geklärt ist.
Die während des Absendevorgangs zusätzlich erhobenen personenbezogenen Daten werden spätestens nach einer Frist von sieben Tagen gelöscht.
**5. Widerspruchs- und Beseitigungsmöglichkeit**
Der*die Nutzer*in hat jederzeit die Möglichkeit, seine*ihre Einwilligung zur Verarbeitung der personenbezogenen Daten zu widerrufen. Nimmt der*die Nutzer*in per E-Mail Kontakt mit uns auf, so kann er der Speicherung seiner personenbezogenen Daten jederzeit widersprechen. In einem solchen Fall kann die Konversation nicht fortgeführt werden.
Alle personenbezogenen Daten, die im Zuge der Kontaktaufnahme gespeichert wurden, werden in diesem Fall gelöscht.
**VII.**                   **Google Firebase**
**1. Beschreibung und Umfang der Datenverarbeitung**
Für unsere App nutzen wir die Trackingdienste von Firebase des Anbieters Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043 („Google“).
Mit Google Analytics für Firebase werden Informationen über die Benutzung der App erfasst. Die Daten werden mit anonymisierter IP-Adresse an einen Server von Google in den USA übertragen und dort gespeichert. Hierdurch können wir beispielsweise deine Bildschirmaufrufe und Betätigung von Buttons analysieren.  Die dabei gewonnen Daten werden nicht mit anderen Nutzer*innendaten verknüpft und können nicht dazu verwendet werden, Nutzer*innen persönlich zu identifizieren.
Wir nutzen Firebase Crashlytics, um Abstürze der App nachvollziehen und dadurch die Stabilität und Zuverlässigkeit unser App verbessern zu können. Im Absturzfall wird automatisch ein Absturzbericht erstellt, der die Art des genutzten Endgerätes, das Betriebssystem, deine letzten Aktivitäten in der App und deine Geolocation in pseudonymer Form enthält und an Google gesendet wird.
**2. Rechtsgrundlage für die Datenverarbeitung**
Rechtsgrundlage für die Datenverarbeitung durch Google Analytics für Firebase ist Art. 6 Abs. 1 S.1 lit. f DSGVO, wobei unser berechtigtes Interesse in der Verbesserung, Stabilität, Funktionalität und Angebotsoptimierung unserer App besteht.
**3. Zweck der Datenverarbeitung**
Die Übermittlung von Daten durch Firebase an Google verfolgt den Zweck, durch die gesammelten Daten die Nutzung der App auszuwerten, wodurch wir unser Angebot verbessern und für Sie als Nutzer*in optimieren können.
**4. Widerspruchs- und Beseitigungsmöglichkeit**
In unserer App kannst du das Tracking durch die Firebase Services unterbinden, indem du (…)
In den Geräteeinstellungen deines Mobilgeräts kannst du die Nutzung der für Google Analytics für Firebase verwendeten Werbe-ID beschränken:
Für Android: Einstellungen > Google > Werbung > Werbe-ID zurücksetzen
Für iOS: Einstellungen > Datenschutz > Werbung > Kein Ad-Tracking.
Du kannst deine Einwilligung für die Datenverarbeitung durch Firebase Crashlytics jederzeit widerrufen, indem du in den Einstellungen der iOS-Apps die Funktion „Absturzberichte“ deaktivierst. Bei Android erfolgt die Deaktivierung über Einstellungen > Google > Nutzung & Diagnose.
Weiterführende Informationen zu Google Firebase findest du unter:
 [https://firebase.google.com/support/privacy](https://firebase.google.com/support/privacy) . 

**VII.**           **Rechte der betroffenen Person**
Werden personenbezogene Daten von dir verarbeitet, bist du Betroffener i.S.d. DSGVO und es stehen dir folgende Rechte gegenüber dem Verantwortlichen zu:
**1. Widerruf deiner Einwilligung zur Datenverarbeitung**
Nur mit deiner ausdrücklichen Einwilligung sind einige Vorgänge der Datenverarbeitung möglich. Ein Widerruf deiner bereits erteilten Einwilligung ist jederzeit möglich.
**2. Auskunftsrecht**
Du hast als Nutzer*in das Recht, auf Antrag eine kostenlose Auskunft darüber zu erhalten, welche personenbezogenen Daten über dich auf welche Weise gespeichert wurden.
**3. Recht auf Berichtigung**
Du hast ein Recht auf Berichtigung und/oder Vervollständigung gegenüber den Verantwortlichen, sofern die verarbeiteten personenbezogenen Daten, die dich betreffen, unrichtig oder unvollständig sind. Die Verantwortlichen haben die Berichtigung unverzüglich vorzunehmen.
**1.** **4.**     **Recht auf Einschränkung der Verarbeitung**
Unter den folgenden Voraussetzungen kannst du die Einschränkung der Verarbeitung der dich betreffenden personenbezogenen Daten verlangen:
(1)  	wenn du die Richtigkeit der dich betreffenden personenbezogenen Daten für eine Dauer bestreitest, die es den Verantwortlichen ermöglicht, die Richtigkeit der personenbezogenen Daten zu überprüfen;
(2)  	die Verarbeitung unrechtmäßig ist und du die Löschung der personenbezogenen Daten ablehnst und stattdessen die Einschränkung der Nutzung der personenbezogenen Daten verlangst;
(3)  	die Verantwortliche die personenbezogenen Daten für die Zwecke der Verarbeitung nicht länger benötigen, du diese jedoch zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen benötigst, oder
(4)  	wenn du Widerspruch gegen die Verarbeitung gemäß Art. 21 Abs. 1 DSGVO eingelegt hast und noch nicht feststeht, ob die berechtigten Gründe des Verantwortlichen gegenüber deinen Gründen überwiegen.
Wurde die Verarbeitung der dich betreffenden personenbezogenen Daten eingeschränkt, dürfen diese Daten – von ihrer Speicherung abgesehen – nur mit deiner Einwilligung oder zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen oder zum Schutz der Rechte einer anderen natürlichen oder juristischen Person oder aus Gründen eines wichtigen öffentlichen Interesses der Union oder eines Mitgliedstaats verarbeitet werden.
Wurde die Einschränkung der Verarbeitung nach den o.g. Voraussetzungen eingeschränkt, wirst du von dem Verantwortlichen unterrichtet, bevor die Einschränkung aufgehoben wird.
**2.** **5.**     **Recht auf Löschung**
(1)LöschungspflichtDu kannst von den Verantwortlichen verlangen, dass die dich betreffenden personenbezogenen Daten unverzüglich gelöscht werden, und der Verantwortliche ist verpflichtet, diese Daten unverzüglich zu löschen, sofern einer der folgenden Gründe zutrifft:
(a)   	Die dich betreffenden personenbezogenen Daten sind für die Zwecke, für die sie erhoben oder auf sonstige Weise verarbeitet wurden, nicht mehr notwendig.
(b)  	Du widerrufst deine Einwilligung, auf die sich die Verarbeitung gem. Art. 6 Abs. 1 lit. A stützte, und es fehlt an einer anderweitigen Rechtsgrundlage für die Verarbeitung.
(c)   	du legst gem. Art. 21 Abs. 1 DSGVO Widerspruch gegen die Verarbeitung ein und es liegen keine vorrangigen berechtigten Gründe für die Verarbeitung vor, oder du legst gem. Art. 21 Abs. 2 DSGVO Widerspruch gegen die Verarbeitung ein.
(d)  	Die dich betreffenden personenbezogenen Daten wurden unrechtmäßig verarbeitet.
(e)   	Die Löschung der dich betreffenden personenbezogenen Daten ist zur Erfüllung einer rechtlichen Verpflichtung nach dem Unionsrecht oder dem Recht der Mitgliedstaaten erforderlich, dem der Verantwortliche unterliegt.
(f)   	 Die dich betreffenden personenbezogenen Daten wurden in Bezug auf angebotene Dienste der Informationsgesellschaft gemäß Art. 8 Abs. 1 DSGVO erhoben.
(2)Information an DritteHaben die Verantwortlichen die dich betreffenden personenbezogenen Daten öffentlich gemacht und sind sie gem. Art. 17 Abs. 1 DSGVO zu deren Löschung verpflichtet, so treffen sie unter Berücksichtigung der verfügbaren Technologie und der Implementierungskosten angemessene Maßnahmen, auch technischer Art, um für die Datenverarbeitung Verantwortliche, die die personenbezogenen Daten verarbeiten, darüber zu informieren, dass du als betroffene Person von ihnen die Löschung aller Links zu diesen personenbezogenen Daten oder von Kopien oder Replikationen dieser personenbezogenen Daten verlangt hast.



**3.** **6.**     **Recht auf Unterrichtung**
Hast du das Recht auf Berichtigung, Löschung oder Einschränkung der Verarbeitung gegenüber den Verantwortlichen geltend gemacht, sind diese verpflichtet, allen Empfängern, denen die Sie betreffenden personenbezogenen Daten offengelegt wurden, diese Berichtigung oder Löschung der Daten oder Einschränkung der Verarbeitung mitzuteilen, es sei denn, dies erweist sich als unmöglich oder ist mit einem unverhältnismäßigen Aufwand verbunden.
Dir steht gegenüber den Verantwortlichen das Recht zu, über diese Empfänger unterrichtet zu werden.
**4.** **7.**       **Recht auf Datenübertragbarkeit**
Du hast das Recht, die dich betreffenden personenbezogenen Daten, die du den Verantwortlichen bereitgestellt hast, in einem strukturierten, gängigen und maschinenlesbaren Format zu erhalten. Außerdem hast du das Recht diese Daten einem anderen Verantwortlichen ohne Behinderung durch dei Verantwortlichen, dem die personenbezogenen Daten bereitgestellt wurden, zu übermitteln, sofern
(a)   	die Verarbeitung auf einer Einwilligung gem. Art. 6 Abs. 1 lit. a DSGVO oder Art. 9 Abs. 2 lit. a DSGVO oder auf einem Vertrag gem. Art. 6 Abs. 1 lit. b DSGVO beruht und
(b)   	die Verarbeitung mithilfe automatisierter Verfahren erfolgt.
In Ausübung dieses Rechts hast du ferner das Recht, zu erwirken, dass die dich betreffenden personenbezogenen Daten direkt von einem Verantwortlichen einem anderen Verantwortlichen übermittelt werden, soweit dies technisch machbar ist. Freiheiten und Rechte anderer Personen dürfen hierdurch nicht beeinträchtigt werden.
Das Recht auf Datenübertragbarkeit gilt nicht für eine Verarbeitung personenbezogener Daten, die für die Wahrnehmung einer Aufgabe erforderlich ist, die im öffentlichen Interesse liegt oder in Ausübung öffentlicher Gewalt erfolgt, die dem Verantwortlichen übertragen wurde.
**5.** **8.**       **Widerspruchsrecht**
Du hast das Recht, aus Gründen, die sich aus deiner besonderen Situation ergeben, jederzeit gegen die Verarbeitung der Sie betreffenden personenbezogenen Daten, die aufgrund von Art. 6 Abs. 1 lit. e oder f DSGVO erfolgt, Widerspruch einzulegen; dies gilt auch für ein auf diese Bestimmungen gestütztes Profiling.
Die Verantwortlichen verarbeiten die dich betreffenden personenbezogenen Daten nicht mehr, es sei denn, sie können zwingende schutzwürdige Gründe für die Verarbeitung nachweisen, die deine Interessen, Rechte und Freiheiten überwiegen, oder die Verarbeitung dient der Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen.
**6.** **9.**     **Recht auf Widerruf der datenschutzrechtlichen Einwilligungserklärung**
Du hast das Recht, deine datenschutzrechtliche Einwilligungserklärung jederzeit zu widerrufen. Durch den Widerruf der Einwilligung wird die Rechtmäßigkeit der aufgrund der Einwilligung bis zum Widerruf erfolgten Verarbeitung nicht berührt.
**7.** **10.**  **Recht auf Beschwerde bei einer Aufsichtsbehörde**
Unbeschadet eines anderweitigen verwaltungsrechtlichen oder gerichtlichen Rechtsbehelfs steht dir das Recht auf Beschwerde bei einer Aufsichtsbehörde, insbesondere in dem Mitgliedstaat ihres Aufenthaltsorts, deines Arbeitsplatzes oder des Orts des mutmaßlichen Verstoßes, zu, wenn du der Ansicht bist, dass die Verarbeitung der Sie betreffenden personenbezogenen Daten gegen die DSGVO verstößt.
Die Aufsichtsbehörde, bei der die Beschwerde eingereicht wurde, unterrichtet den Beschwerdeführer über den Stand und die Ergebnisse der Beschwerde einschließlich der Möglichkeit eines gerichtlichen Rechtsbehelfs nach Art. 78 DSGVO.



''';
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Datenschutz'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            PrivacyText(
              text: _markdownData,
            ),
          ])),
        ],
      ),
    );
  }
}

class PrivacyText extends StatelessWidget {
  final String text;

  //Constructor

  PrivacyText({
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
