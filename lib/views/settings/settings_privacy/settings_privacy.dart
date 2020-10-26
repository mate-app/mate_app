import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../shared/shared.dart';
import '../../../styles/styles.dart';

class SettingsPrivacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Datenschutz'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                    child: MarkdownBody(
                      data: '''
Wir begrüßen dich bei unserer App und freuen uns über dein Interesse. Der Schutz deiner personenbezogenen Daten ist uns ein wichtiges Anliegen. Deshalb betreiben wir unsere Aktivitäten in Übereinstimmung mit den anwendbaren Rechtsvorschriften zum Schutz von personenbezogenen Daten und zur Datensicherheit. Wir möchten dich nachfolgend darüber informieren, welche Daten deines Besuchs zu welchen Zwecken verwendet werden.

## I. Name und Anschrift der Verantwortlichen
Verantwortliche im Sinne der Datenschutz-Grundverordnung und anderer nationaler Datenschutzgesetze der Mitgliedsstaaten sowie sonstiger datenschutzrechtlicher Bestimmungen sind:  
  
**Mathis Fandré**  
Möllingstr. 20  
24103 Kiel  
tel.: 0151 41 65 78 33  
email:  mathis@mate-app.de  
  
**Ramin Nobakht**  
Knooperweg. 113  
24118 Kiel  
tel.: 0176 84 64 85 24  
email:  ramin@mate-app.de  
  
**Tobias Pörtner**  
Kirchhofallee 5  
24103 Kiel  
tel.:0170 82 75 715  
email:  tobias@mate-app.de  

## II. Allgemeines zur Datenverarbeitung
### 1. Umfang der Verarbeitung personenbezogener Daten
Wir verarbeiten personenbezogene Daten unserer Nutzer:innen grundsätzlich nur, soweit dies zur Bereitstellung einer funktionsfähigen mobilen App sowie unserer Inhalte und Leistungen erforderlich ist. Die Verarbeitung personenbezogener Daten unserer Nutzer:innen erfolgt regelmäßig nur nach Einwilligung der jeweiligen Nutzer:innen. Eine Ausnahme gilt in solchen Fällen, in denen ein vorheriges Einholen einer Einwilligung aus tatsächlichen Gründen nicht möglich ist und die Verarbeitung der Daten durch gesetzliche Vorschriften gestattet ist.
Alle von uns erhobenen Daten werden ausschließlich über SSL-verschlüsselte Verbindungen übertragen.
### 2. Rechtsgrundlage für die Verarbeitung personenbezogener Daten
Soweit wir für Verarbeitungsvorgänge personenbezogener Daten eine Einwilligung der betroffenen Person einholen, dient Art. 6 Abs. 1 lit. a EU-Datenschutzgrundverordnung (DSGVO) als Rechtsgrundlage.
Bei der Verarbeitung von personenbezogenen Daten, die zur Erfüllung eines Vertrages, dessen Vertragspartei die betroffene Person ist, erforderlich ist, dient Art. 6 Abs. 1 lit. b DSGVO als Rechtsgrundlage. Dies gilt auch für Verarbeitungsvorgänge, die zur Durchführung vorvertraglicher Maßnahmen erforderlich sind.
Soweit eine Verarbeitung personenbezogener Daten zur Erfüllung einer rechtlichen Verpflichtung erforderlich ist, der unser Unternehmen unterliegt, dient Art. 6 Abs. 1 lit. c DSGVO als Rechtsgrundlage.
Für den Fall, dass lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen Person eine Verarbeitung personenbezogener Daten erforderlich machen, dient Art. 6 Abs. 1 lit. d DSGVO als Rechtsgrundlage.
Ist die Verarbeitung zur Wahrung eines berechtigten Interesses unseres Unternehmens oder eines Dritten erforderlich und überwiegen die Interessen, Grundrechte und Grundfreiheiten des Betroffenen das erstgenannte Interesse nicht, so dient Art. 6 Abs. 1 lit. f DSGVO als Rechtsgrundlage für die Verarbeitung.
### 3. Datenlöschung und Speicherdauer
Die personenbezogenen Daten der betroffenen Person werden gelöscht oder gesperrt, sobald der Zweck der Speicherung entfällt. Eine Speicherung kann darüber hinaus erfolgen, wenn dies durch den europäischen oder nationalen Gesetzgeber in unionsrechtlichen Verordnungen, Gesetzen oder sonstigen Vorschriften, denen der Verantwortliche unterliegt, vorgesehen wurde. Eine Sperrung oder Löschung der Daten erfolgt auch dann, wenn eine durch die genannten Normen vorgeschriebene Speicherfrist abläuft, es sei denn, dass eine Erforderlichkeit zur weiteren Speicherung der Daten für einen Vertragsabschluss oder eine Vertragserfüllung besteht.

## III. Verarbeitung von Identifikationsdaten des Nutzers aus dem Universitätsnetzwerk
### 1. Beschreibung und Umfang der Datenverarbeitung
Bei der Registrierung in der App werden von Nutzer:innen über Auswahlfelder personenbezogene Daten an uns übermittelt. Diese Daten beinhalten besuchte Bildungseinrichtung, Fachbereich, Studiengang, Fachsemester und Sprache.
Außerdem gibt der:die Nutzer:in bei der Registrierung die Identifikationsdaten, die für die Anmeldung im Universitätsnetzwerk notwendig sind, an. E-Mail Adresse und Passwort der Nutzer:innen werden verwendet, um die Legitimität der Identifikationsdaten durch Anmeldung im Universitätsnetzwerk zu überprüfen. Nach erfolgreicher Anmeldung werden die Daten besuchte Bildungseinrichtung, Fachbereich, Studiengang, Fachsemester, Sprache und E-Mail Adresse der Nutzer:innen mit einer eindeutigen User-ID verknüpft und gespeichert. Das Passwort der Nutzer:innen wird von einem ISO 27018 (https://firebase.google.com/downloads/gdpr/2019_Firebase_ISO_27018.pdf) geprüftem Dienst verschlüsselt und ist für uns uneinsehbar.
Auf dem Endgerät der Nutzer:innen werden weiterhin bei der Registrierung E-Mail Adresse und Passwort lokal gespeichert, die nicht an uns übermittelt werden. 
In der App gibt es ein Bewertungssystem für die Mensagerichte. Es werden die positiven und negativen Bewertungen von Gerichten der Nutzer:innen gespeichert und mit einer eindeutigen User-ID verknüpft. Die positiven und negativen Bewertungen aller Nutzer:innen werden zusammengerechnet und als eine nicht zurückverfolgbare Zahl und für alle Nutzer:innen sichtbar in der App dargestellt.
### 2. Rechtsgrundlage für die Datenverarbeitung
Rechtsgrundlage für die bei der Registrierung erhobenen personenbezogenen Daten und Identifikationsdaten ist deine Einwilligung (Art. 6 Abs. 1 lit. a DSGVO).
### 3. Zweck der Datenverarbeitung
Die personenbezogenen Daten werden von uns verarbeitet, um eine individuelle Funktionsweise der App zu ermöglichen. So ist beispielsweise die besuchte Bildungseinrichtung relevant, um nur Semesterpläne und Mensapläne, die den/die Nutzer:in betreffen, anzuzeigen.
Die Identifikationsdaten der Nutzer:innen dienen uns, um plattformübergreifenden, individuellen Service anzubieten und von verschiedenen Endgeräten auf die in der App zur Verfügung gestellten Informationen zuzugreifen.
Die lokale Speicherung von E-Mail Adresse und Passwort wird zur Authentifizierung im Universitätsnetzwerk zum Abruf von für den:die konkreten Nutzer:in relevanten Prüfungsinformationen der Kurse verwendet. 
Die Bewertungsdaten der Mensagerichte werden gespeichert um den Nutzer:innen ein Stimmungsbild über die Beliebtheit der Mensagerichte des heutigen Tages bieten zu können.
### 4. Dauer der Speicherung
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Nach einem Jahr der Nichtnutzung unserer App werden automatisiert alle an uns übermittelten personenbezogenen Daten und Identifikationsdaten gelöscht.
### 5. Widerspruchs- und Beseitigungsmöglichkeit
Der:die Nutzer:in hat jederzeit die Möglichkeit, seine:ihre Einwilligung zur Verarbeitung der personenbezogen Daten und Identifikationsdaten zu widerrufen. Der Widerruf der Einwilligungserklärung erfolgt durch Mitteilung an die Verantwortlichen per E-Mail.

## IV. Verarbeitung von personenbezogenen Daten aus dem Universitätsnetzwerk
### 1. Beschreibung und Umfang der Datenverarbeitung
Einmalig nach der Registrierung und Login in der App und danach nur auf manuelle Anfrage der Nutzer:innen werden mithilfe der lokal gespeicherten Identifikationsdaten folgende im Universitätsnetzwerk hinterlegte personenbezogenen Daten an uns übermittelt und mit der Identifikationsnummer der Nutzer:innen verknüpft:
(1) Studienfächer   
(2) Creditpoints
(3) Noten und bestandene / nicht bestandene Prüfungen.
Die Verarbeitung der Daten erfolgt ausschließlich zum Zweck ihrer Erhebung. Es erfolgt keinesfalls eine Weitergabe an Dritte. Weitere im Universitätsnetzwerk gespeicherte personenbezogene Daten wie z.B. der Wohnort der Nutzer:innen werden von uns in keinem Fall verarbeitet.
### 2. Rechtsgrundlage für die Datenverarbeitung
Rechtsgrundlage für die bei der Anmeldung erhobenen Identifikationsdaten ist deine Einwilligung (Art. 6 Abs. 1 lit. a DSGVO).
### 3. Zweck der Datenverarbeitung
Wir nutzen deine Daten, um die Funktionalität der App, den Nutzer:innen eine Übersicht hinsichtlich aller für den Universitätsalltag relevanten Informationen in Form einer einzigen Applikation zur Verfügung zu stellen, bereitzustellen.
### 4. Dauer der Speicherung
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Nach einem Jahr der Nichtnutzung unserer App werden automatisiert alle an uns übermittelten personenbezogenen Daten gelöscht.
### 5. Widerspruchs- und Beseitigungsmöglichkeit
Der:die Nutzer:in hat jederzeit die Möglichkeit, seine:ihre Einwilligung zur Verarbeitung der Identifikationsdaten zu widerrufen. Der Widerruf der Einwilligungserklärung erfolgt durch Mitteilung an den Verantwortlichen per E-Mail.

## V. Kontaktformular und E-Mail Kontakt
### 1. Beschreibung und Umfang der Datenverarbeitung
Es ist eine Kontaktaufnahme über die in unserer App bereitgestellte E-Mail-Adresse möglich. In diesem Fall werden die mit der E-Mail übermittelten personenbezogenen Daten der Nutzer:innen gespeichert.
Es erfolgt in diesem Zusammenhang keine Weitergabe der Daten an Dritte. Die Daten werden ausschließlich für die Verarbeitung der Anfrage verwendet.
### 2. Rechtsgrundlage für die Datenverarbeitung
Rechtsgrundlage für die Verarbeitung der Daten ist bei Vorliegen einer Einwilligung des:der Nutzer:in nach Art. 6 Abs. 1 lit. a DSGVO.
Rechtsgrundlage für die Verarbeitung der Daten, die im Zuge einer Übersendung einer E-Mail übermittelt werden, ist Art. 6 Abs. 1 lit. f DSGVO.
### 3. Zweck der Datenverarbeitung
Die Verarbeitung der personenbezogenen Daten aus der Eingabemaske dient uns allein zur Bearbeitung der Kontaktaufnahme. Im Falle einer Kontaktaufnahme per E-Mail liegt hieran auch das erforderliche berechtigte Interesse an der Verarbeitung der Daten.
### 4. Dauer der Speicherung
Die Daten werden gelöscht, sobald sie für die Erreichung des Zweckes ihrer Erhebung nicht mehr erforderlich sind. Für die personenbezogenen Daten die per E-Mail übersandt wurden, ist dies dann der Fall, wenn die jeweilige Konversation mit dem/der Nutzer:in beendet ist. Beendet ist die Konversation dann, wenn sich aus den Umständen entnehmen lässt, dass der betroffene Sachverhalt abschließend geklärt ist.
### 5. Widerspruchs- und Beseitigungsmöglichkeit
Der:die Nutzer:in hat jederzeit die Möglichkeit, seine:ihre Einwilligung zur Verarbeitung der personenbezogenen Daten zu widerrufen. Nimmt der:die Nutzer:in per E-Mail Kontakt mit uns auf, so kann er der Speicherung seiner:ihrer personenbezogenen Daten jederzeit widersprechen. In einem solchen Fall kann die Konversation nicht fortgeführt werden.
Alle personenbezogenen Daten, die im Zuge der Kontaktaufnahme gespeichert wurden, werden in diesem Fall gelöscht.

## VI. Google Firebase
### 1. Beschreibung und Umfang der Datenverarbeitung
Für unsere App nutzen wir die Trackingdienste von Firebase des Anbieters Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043 („Google“).
Mit Google Analytics für Firebase werden Informationen über die Benutzung der App erfasst. Die Daten werden mit anonymisierter IP-Adresse an einen Server von Google in den USA übertragen und dort gespeichert. Hierdurch können wir beispielsweise deine Bildschirmaufrufe und Betätigung von Buttons analysieren. Die dabei gewonnen Daten werden nicht mit anderen Nutzer:innen-Daten verknüpft und können nicht dazu verwendet werden, Nutzer:innen persönlich zu identifizieren.
Wir nutzen Firebase Crashlytics, um Abstürze der App nachvollziehen und dadurch die Stabilität und Zuverlässigkeit unser App verbessern zu können. Im Absturzfall wird automatisch ein Absturzbericht erstellt, der die Art des genutzten Endgerätes, das Betriebssystem, deine letzten Aktivitäten in der App und deine Geolocation in pseudonymer Form enthält und an Google gesendet wird.
### 2. Rechtsgrundlage für die Datenverarbeitung
Rechtsgrundlage für die Datenverarbeitung durch Google Analytics für Firebase ist Art. 6 Abs. 1 S.1 lit. f DSGVO, wobei unser berechtigtes Interesse in der Verbesserung, Stabilität, Funktionalität und Angebotsoptimierung unserer App besteht.
### 3. Zweck der Datenverarbeitung
Die Übermittlung von Daten durch Firebase an Google verfolgt den Zweck, durch die gesammelten Daten die Nutzung der App auszuwerten, wodurch wir unser Angebot verbessern und für Sie als Nutzer:in optimieren können.
### 4. Widerspruchs- und Beseitigungsmöglichkeit
In unserer App kannst du das Tracking durch die Firebase Services unterbinden, indem du es unter Einstellungen > Account > Analytics deaktivierst
In den Geräteeinstellungen deines Mobilgerätes kannst du die Nutzung der für Google Analytics für Firebase verwendeten Werbe-ID beschränken:
Für Android: Einstellungen > Google > Werbung > Werbe-ID zurücksetzen
Für iOS: Einstellungen > Datenschutz > Werbung > Kein Ad-Tracking.
Weiterführende Informationen zu Google Firebase findest du unter:
https://firebase.google.com/support/privacy. 

## VII. Rechte der betroffenen Person
Werden personenbezogene Daten von dir verarbeitet, bist du Betroffene:r i.S.d. DSGVO und es stehen dir folgende Rechte gegenüber den Verantwortlichen zu:
### 1. Widerruf deiner Einwilligung zur Datenverarbeitung
Nur mit deiner ausdrücklichen Einwilligung sind einige Vorgänge der Datenverarbeitung möglich. Ein Widerruf deiner bereits erteilten Einwilligung ist jederzeit möglich.
### 2. Auskunftsrecht
Du hast als Nutzer:in das Recht, auf Antrag eine kostenlose Auskunft darüber zu erhalten, welche personenbezogenen Daten über dich auf welche Weise gespeichert wurden.
### 3. Recht auf Berichtigung
Du hast ein Recht auf Berichtigung und/oder Vervollständigung gegenüber den Verantwortlichen, sofern die verarbeiteten personenbezogenen Daten, die dich betreffen, unrichtig oder unvollständig sind. Die Verantwortlichen haben die Berichtigung unverzüglich vorzunehmen.
### 4. Recht auf Einschränkung der Verarbeitung
Unter den folgenden Voraussetzungen kannst du die Einschränkung der Verarbeitung der dich betreffenden personenbezogenen Daten verlangen:
(1) wenn du die Richtigkeit der dich betreffenden personenbezogenen Daten für eine Dauer bestreitest, die es den Verantwortlichen ermöglicht, die Richtigkeit der personenbezogenen Daten zu überprüfen;
(2) die Verarbeitung unrechtmäßig ist und du die Löschung der personenbezogenen Daten ablehnst und stattdessen die Einschränkung der Nutzung der personenbezogenen Daten verlangst;
(3) die Verantwortliche die personenbezogenen Daten für die Zwecke der Verarbeitung nicht länger benötigen, du diese jedoch zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen benötigst, oder
(4) wenn du Widerspruch gegen die Verarbeitung gemäß Art. 21 Abs. 1 DSGVO eingelegt hast und noch nicht feststeht, ob die berechtigten Gründe des Verantwortlichen gegenüber deinen Gründen überwiegen.
Wurde die Verarbeitung der dich betreffenden personenbezogenen Daten eingeschränkt, dürfen diese Daten – von ihrer Speicherung abgesehen – nur mit deiner Einwilligung oder zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen oder zum Schutz der Rechte einer anderen natürlichen oder juristischen Person oder aus Gründen eines wichtigen öffentlichen Interesses der Union oder eines Mitgliedstaats verarbeitet werden.
Wurde die Einschränkung der Verarbeitung nach den o.g. Voraussetzungen eingeschränkt, wirst du von den Verantwortlichen unterrichtet, bevor die Einschränkung aufgehoben wird.
### 5. Recht auf Löschung
(1)  Löschungspflicht.
Du kannst von den Verantwortlichen verlangen, dass die dich betreffenden personenbezogenen Daten unverzüglich gelöscht werden, und die Verantwortlichen sind verpflichtet, diese Daten unverzüglich zu löschen, sofern einer der folgenden Gründe zutrifft:
(a) Die dich betreffenden personenbezogenen Daten sind für die Zwecke, für die sie erhoben oder auf sonstige Weise verarbeitet wurden, nicht mehr notwendig.
(b) Du widerrufst deine Einwilligung, auf die sich die Verarbeitung gem. Art. 6 Abs. 1 lit. A stützte, und es fehlt an einer anderweitigen Rechtsgrundlage für die Verarbeitung.
(c) Du legst gem. Art. 21 Abs. 1 DSGVO Widerspruch gegen die Verarbeitung ein und es liegen keine vorrangigen berechtigten Gründe für die Verarbeitung vor, oder du legst gem. Art. 21 Abs. 2 DSGVO Widerspruch gegen die Verarbeitung ein.
(d) Die dich betreffenden personenbezogenen Daten wurden unrechtmäßig verarbeitet.
(e) Die Löschung der dich betreffenden personenbezogenen Daten ist zur Erfüllung einer rechtlichen Verpflichtung nach dem Unionsrecht oder dem Recht der Mitgliedstaaten erforderlich, dem die Verantwortlichen unterliegen.
(f) Die dich betreffenden personenbezogenen Daten wurden in Bezug auf angebotene Dienste der Informationsgesellschaft gemäß Art. 8 Abs. 1 DSGVO erhoben.
(2) Information an Dritte.
Haben die Verantwortlichen die dich betreffenden personenbezogenen Daten öffentlich gemacht und sind sie gem. Art. 17 Abs. 1 DSGVO zu deren Löschung verpflichtet, so treffen sie unter Berücksichtigung der verfügbaren Technologie und der Implementierungskosten angemessene Maßnahmen, auch technischer Art, um für die Datenverarbeitung Verantwortliche, die die personenbezogenen Daten verarbeiten, darüber zu informieren, dass du als betroffene Person von ihnen die Löschung aller Links zu diesen personenbezogenen Daten oder von Kopien oder Replikationen dieser personenbezogenen Daten verlangt hast.
###  6. Recht auf Unterrichtung
Hast du das Recht auf Berichtigung, Löschung oder Einschränkung der Verarbeitung gegenüber den Verantwortlichen geltend gemacht, sind diese verpflichtet, allen Empfängern, denen die Sie betreffenden personenbezogenen Daten offengelegt wurden, diese Berichtigung oder Löschung der Daten oder Einschränkung der Verarbeitung mitzuteilen, es sei denn, dies erweist sich als unmöglich oder ist mit einem unverhältnismäßigen Aufwand verbunden.
Dir steht gegenüber den Verantwortlichen das Recht zu, über diese Empfänger unterrichtet zu werden.
### 7. Recht auf Datenübertragbarkeit
Du hast das Recht, die dich betreffenden personenbezogenen Daten, die du den Verantwortlichen bereitgestellt hast, in einem strukturierten, gängigen und maschinenlesbaren Format zu erhalten. Außerdem hast du das Recht diese Daten einem anderen Verantwortlichen ohne Behinderung durch die Verantwortlichen, dem die personenbezogenen Daten bereitgestellt wurden, zu übermitteln, sofern
(a) die Verarbeitung auf einer Einwilligung gem. Art. 6 Abs. 1 lit. a DSGVO oder Art. 9 Abs. 2 lit. a DSGVO oder auf einem Vertrag gem. Art. 6 Abs. 1 lit. b DSGVO beruht und
(b) die Verarbeitung mithilfe automatisierter Verfahren erfolgt.
In Ausübung dieses Rechts hast du ferner das Recht, zu erwirken, dass die dich betreffenden personenbezogenen Daten direkt von einem Verantwortlichen einem anderen Verantwortlichen übermittelt werden, soweit dies technisch machbar ist. Freiheiten und Rechte anderer Personen dürfen hierdurch nicht beeinträchtigt werden.
Das Recht auf Datenübertragbarkeit gilt nicht für eine Verarbeitung personenbezogener Daten, die für die Wahrnehmung einer Aufgabe erforderlich ist, die im öffentlichen Interesse liegt oder in Ausübung öffentlicher Gewalt erfolgt, die dem Verantwortlichen übertragen wurde.
### 8. Widerspruchsrecht
Du hast das Recht, aus Gründen, die sich aus deiner besonderen Situation ergeben, jederzeit gegen die Verarbeitung der Sie betreffenden personenbezogenen Daten, die aufgrund von Art. 6 Abs. 1 lit. e oder f DSGVO erfolgt, Widerspruch einzulegen; dies gilt auch für ein auf diese Bestimmungen gestütztes Profiling.
Die Verantwortlichen verarbeiten die dich betreffenden personenbezogenen Daten nicht mehr, es sei denn, sie können zwingende schutzwürdige Gründe für die Verarbeitung nachweisen, die deine Interessen, Rechte und Freiheiten überwiegen, oder die Verarbeitung dient der Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen.
### 9. Recht auf Widerruf der datenschutzrechtlichen Einwilligungserklärung
Du hast das Recht, deine datenschutzrechtliche Einwilligungserklärung jederzeit zu widerrufen. Durch den Widerruf der Einwilligung wird die Rechtmäßigkeit der aufgrund der Einwilligung bis zum Widerruf erfolgten Verarbeitung nicht berührt.
### 10. Recht auf Beschwerde bei einer Aufsichtsbehörde
Unbeschadet eines anderweitigen verwaltungsrechtlichen oder gerichtlichen Rechtsbehelfs steht dir das Recht auf Beschwerde bei einer Aufsichtsbehörde, insbesondere in dem Mitgliedstaat ihres Aufenthaltsorts, deines Arbeitsplatzes oder des Orts des mutmaßlichen Verstoßes, zu, wenn du der Ansicht bist, dass die Verarbeitung der Sie betreffenden personenbezogenen Daten gegen die DSGVO verstößt.
Die Aufsichtsbehörde, bei der die Beschwerde eingereicht wurde, unterrichtet den:die Beschwerdeführer:in über den Stand und die Ergebnisse der Beschwerde einschließlich der Möglichkeit eines gerichtlichen Rechtsbehelfs nach Art. 78 DSGVO.''',
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(Theme.of(context))
                              .copyWith(
                                  p: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
