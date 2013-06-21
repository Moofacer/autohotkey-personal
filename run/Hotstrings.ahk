#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#h::
; This will move the InputBox's caret to a more friendly position:
SetTimer, MoveCaret, 10
; Show the InputBox, providing the default hotstring:
InputBox, Hotstring, New Hotstring, Provide the corrected word on the right side. You can also edit the left side if you wish.`n`nExample entry:`n::teh::the,,,,,,,, ::incorrect::correct

if ErrorLevel <> 0  ; The user pressed Cancel.
    return
; Otherwise, add the hotstring and reload the script:
FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; Put a `n at the beginning in case file lacks a blank line at its end.
Reload
Sleep 200 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
IfMsgBox, Yes, Edit
return

MoveCaret:
IfWinNotActive, New Hotstring
    return
; Otherwise, move the InputBox's insertion point to where the user will type the abbreviation.
Send {HOME}
Loop % StrLen(Hotstring) + 4
    SendInput {Right}
SetTimer, MoveCaret, Off
return

;------------------------------------------------------------------------------
; Accented English words, from, amongst others,
; http://en.wikipedia.org/wiki/List_of_English_words_with_diacritics
; I have included all the ones compatible with reasonable codepages, and placed
; those that may often not be accented either from a clash with an unaccented 
; word (resume), or because the unaccented version is now common (cafe).
;------------------------------------------------------------------------------
::aesop::Asop
::a bas::a bas
::a la::a la
::ancien regime::Ancien Regime
::angstrom::Angstrom
::angstroms::Angstroms
::anime::anime
::animes::animes
::ao dai::ao dai
::apertif::apertif
::apertifs::apertifs
::applique::applique
::appliques::appliques
::apres::apres
::arete::arete
::attache::attache
::attaches::attaches
::auto-da-fe::auto-da-fe
::belle epoque::belle epoque
::bete noire::bete noire
::betise::betise
::Bjorn::Bjorn
::blase::blase
::boite::boite
::boutonniere::boutonniere
::canape::canape
::canapes::canapes
::celebre::celebre
::celebres::celebres
::chaines::chaines
::cinema verite::cinema verite
::cinemas verite::cinemas verite
::cinema verites::cinema verites
::champs-elysees::Champs-Elysees
::charge d'affaires::charge d'affaires
::chateau::chateau
::chateaux::chateaux
::chateaus::chateaus
::cliche::cliche
::cliched::cliched
::cliches::cliches
::cloisonne::cloisonne
::consomme::consomme
::consommes::consommes
::communique::communique
::communiques::communiques
::confrere::confrere
::confreres::confreres
::cortege::cortege
::corteges::corteges
::coup d'etat::coup d'etat
::coup d'etats::coup d'etats
::coup de tat::coup d'etat
::coup de tats::coup d'etats
::coup de grace::coup de grace
::creche::creche
::creches::creches
::coulee::coulee
::coulees::coulees
::creme brulee::creme brulee
::creme brulees::creme brulees
::creme caramel::creme caramel
::creme caramels::creme caramels
::creme de cacao::creme de cacao
::creme de menthe::creme de menthe
::crepe::crepe
::crepes::crepes
::creusa::Creusa
::crouton::crouton
::croutons::croutons
::crudites::crudites
::curacao::curacao
::dais::dais
::daises::daises
::debacle::debacle
::debacles::debacles
::debutante::debutante
::debutants::debutants
::declasse::declasse
::decolletage::decolletage
::decollete::decollete
::decor::decor
::decors::decors
::decoupage::decoupage
::degage::degage
::deja vu::deja vu
::demode::demode
::denoument::denoument
::derailleur::derailleur
::derriere::derriere
::deshabille::deshabille
::detente::detente
::diamante::diamante
::discotheque::discotheque
::discotheques::discotheques
::divorcee::divorcee
::divorcees::divorcees
::doppelganger::doppelganger
::doppelgangers::doppelgangers
::eclair::eclair
::eclairs::eclairs
::eclat::eclat
::el nino::El Nino
::elan::elan
::emigre::emigre
::emigres::emigres
::entree::entree
::entrees::entrees
::entrepot::entrepot
::entrecote::entrecote
::epee::epee
::epees::epees
::etouffee::etouffee
::facade::facade
::facades::facades
::fete::fete
::fetes::fetes
::faience::faience
::fiance::fiance
::fiances::fiances
::fiancee::fiancee
::fiancees::fiancees
::filmjolk::filmjolk
::fin de siecle::fin de siecle
::flambe::flambe
::flambes::flambes
::fleche::fleche
::Fohn wind::Fohn wind
::folie a deux::folie a deux
::folies a deux::folies a deux
::fouette::fouette
::frappe::frappe
::frappes::frappes
:?*:fraulein::fraulein
:?*:fuhrer::Fuhrer
::garcon::garcon
::garcons::garcons
::gateau::gateau
::gateaus::gateaus
::gateaux::gateaux
::gemutlichkeit::gemutlichkeit
::glace::glace
::glogg::glogg
::gewurztraminer::Gewurztraminer
::gotterdammerung::Gotterdammerung
::grafenberg spot::Grafenberg spot
::habitue::habitue
::ingenue::ingenue
::jager::jager
::jalapeno::jalapeno
::jalapenos::jalapenos
::jardiniere::jardiniere
::krouzek::krou?ek
::kummel::kummel
::kaldolmar::kaldolmar
::landler::landler
::langue d'oil::langue d'oil
::la nina::La Nina
::litterateur::litterateur
::lycee::lycee
::macedoine::macedoine
::macrame::macrame
::maitre d'hotel::maitre d'hotel
::malaguena::malaguena
::manana::manana
::manege::manege
::manque::manque
::materiel::materiel
::matinee::matinee
::matinees::matinees
::melange::melange
::melee::melee
::melees::melees
::menage a trois::menage a trois
::menages a trois::menages a trois
::mesalliance::mesalliance
::metier::metier
::minaudiere::minaudiere
::mobius strip::Mobius strip
::mobius strips::Mobius strips
::moire::moire
::moireing::moireing
::moires::moires
::motley crue::Motley Crue
::motorhead::Motorhead
::naif::naif
::naifs::naifs
::naive::naive
::naiver::naiver
::naives::naives
::naivete::naivete
::nee::nee
::negligee::negligee
::negligees::negligees
::neufchatel cheese::Neufchatel cheese
::nez perce::Nez Perce
::noel::Noel
::noels::Noels
::numero uno::numero uno
::objet trouve::objet trouve
::objets trouve::objets trouve
::ombre::ombre
::ombres::ombres
::omerta::omerta
::opera bouffe::opera bouffe
::operas bouffe::operas bouffe
::opera comique::opera comique
::operas comique::operas comique
::outre::outre
::papier-mache::papier-mache
::passe::passe
::piece de resistance::piece de resistance
::pied-a-terre::pied-a-terre
::plisse::plisse
::pina colada::Pina Colada
::pina coladas::Pina Coladas
::pinata::pinata
::pinatas::pinatas
::pinon::pinon
::pinons::pinons
::pirana::pirana
::pique::pique
::piqued::piqued
::piu::piu
::plie::plie
::precis::precis
::polsa::polsa
::pret-a-porter::pret-a-porter
::protoge::protege
::protege::protege
::proteged::proteged
::proteges::proteges
::protegee::protegee
::protegees::protegees
::protegeed::protegeed
::puree::puree
::pureed::pureed
::purees::purees
::Quebecois::Quebecois
::raison d'etre::raison d'etre
::recherche::recherche
::reclame::reclame
::resume::resume
::resume::resume
::resumes::resumes
::resumes::resumes
::retrousse::retrousse
::risque::risque
::riviere::riviere
::roman a clef::roman a clef
::roue::roue
::saute::saute
::sauted::sauted
::seance::seance
::seances::seances
::senor::senor
::senors::senors
::senora::senora
::senoras::senoras
::senorita::senorita
::senoritas::senoritas
::sinn fein::Sinn Fein
::smorgasbord::smorgasbord
::smorgasbords::smorgasbords
::smorgastarta::smorgastarta
::soigne::soigne
::soiree::soiree
::soireed::soireed
::soirees::soirees
::souffle::souffle
::souffles::souffles
::soupcon::soupcon
::soupcons::soupcons
::surstromming::surstromming
::tete-a-tete::tete-a-tete
::tete-a-tetes::tete-a-tetes
::touche::touche
::tourtiere::tourtiere
::ubermensch::Ubermensch
::ubermensches::Ubermensches
::ventre a terre::ventre a terre
::vicuna::vicuna
::vin rose::vin rose
::vins rose::vins rose
::vis a vis::vis a vis
::vis-a-vis::vis-a-vis
::voila::voila

;-------------------------------------------------------------------------------
; Anything below this point was added to the script by the user via hotkey.
;-------------------------------------------------------------------------------