/************ 
 * 1. esceptaj vortoj ne sekvantaj tute la normalajn derivadregulojn (prunt/e~don/i)
 * 2. vortoj, kiujn la analizilo pro la ordo de la analizo ne ĝuste
 *    analizas en la unua provo, ekz- nask-iĝ-tag/o anst. nask/iĝ-tag/o
************/
%:- ensure_loaded(gramatiko).

:- op( 1120, xfx, user:(<-) ). % disigas regulo-kapon, de esceptesprimo
:- op( 500, yfx, user:(~) ). % signas disigindajn vortojn

:- multifile rv_sen_fin/5, vorto/5.
:- discontiguous rv_sen_fin/5, vorto/5.

:- encoding(utf8).

/**
 * Helpaj reguloj por eviti misanalizon, precipe pro la ordo de vortoj en la vortaro
 * kaj la ordo de aplikataj gramatik-reguloj, okazas foje misanalizoj.
 * Ankaŭ povas esti, ke mankas ankoraŭ gramatik-reguloj, sed tiujn prefere
 * provu aldoni aŭ notu en la malsupra alineo 'e' = esceptoj
 * 
 * 'h' = helpa regulo
 */

% PLIBONIGU: la malsupraj vortoj estas kunmetitaj de fundamentaj vortelementoj
% sed ni ne povas indiki tion momente, ni devus subteni trian argumenton en 
% rule_ref (rv_sen_fin)...

rv_sen_fin(h,adj) <- ali+land. % ne al/il+and
rv_sen_fin(h,best) <- ali+land/ul. % ne al/il+and/ul
rv_sen_fin(h,adv) <- ali+lok. % ne al/il+ok/e
rv_sen_fin(h,tr) <- alt/ig. % ne al/tig

rv_sen_fin(h,subst) <- ban/dom. % ne band-om

rv_sen_fin(h,adj) <- 'daŭr'/i~pov. % 
rv_sen_fin(h,tr) <- diskut. % por eviti misanalizon dis/kut

rv_sen_fin(h,best) <- eksterm/ant. % ne ent/er/ig
rv_sen_fin(h,tr) <- en/ter/ig. % ne ent/er/ig
rv_sen_fin(h,ntr) <- est/'iĝ'. % konfuzeblo "esti" kun "esto" (estono)

rv_sen_fin(h,tr) <- far/ad. % ne analizu farad/
rv_sen_fin(h,adj) <- fin/it. % ne analizu fi/nit
rv_sen_fin(h,tr) <- for/star/ig. % ne analizu farad/

rv_sen_fin(h,ntr) <- glu-mark. % por eviti misanalizon glum-ark
rv_sen_fin(h,subst) <- grup/et. % por eviti analizon grupet/

rv_sen_fin(h,subst) <- jar/dek. % por eviti analizon jard-ek/

rv_sen_fin(h,subst) <- kol-har/ar. % ne kol-Harar/

rv_sen_fin(h,best) <- mal/ferm/at. % ne fermat/
rv_sen_fin(h,tr) <- mal/supr/en~ig.
rv_sen_fin(h,ntr) <- membr/'iĝ'. % por eviti misanalizon mem/briĝ
rv_sen_fin(h,subst) <- membr/o-kvant. % por eviti misanalizon mem/brok/vant
rv_sen_fin(h,subst) <- membr/ec. % por eviti misanalizon mem/brec

rv_sen_fin(h,subst) <- nask/'iĝ'. % por faciligi rekoni kunmetitajn kiel naskiĝtago
rv_sen_fin(h,subst) <- naz/o-tru. % por faciligi rekoni kunmetitajn kiel naskiĝtago

rv_sen_fin(h,adv) <- plej~part.
rv_sen_fin(h,best) <- pord/eg/ist.
rv_sen_fin(h,best) <- pord/ist.
rv_sen_fin(h,subst) <- post/e/ul.
rv_sen_fin(h,adj) <- postul/em. % por eviti misanalizon post/ulem
rv_sen_fin(h,adj) <- postul/at. % por eviti misanalizon postulat/
rv_sen_fin(h,adv) <- prov/ant. % ne pro/vant

rv_sen_fin(h,tr) <- 'reĝ'/ig.
rv_sen_fin(h,adj) <- respond/ec.

rv_sen_fin(h,subst) <- sak/strat.
rv_sen_fin(h,tr) <- sen/ig. % seno estas ankaŭ monunuo!
rv_sen_fin(h,ntr) <- sen/vest/'iĝ'. % ne sen/vestiĝ/
rv_sen_fin(h,subst) <- sun-lev/'iĝ'.
rv_sen_fin(h,tr) <- supr/en~ig.
rv_sen_fin(h,subst) <- suveren/ec. % evitu misnalizon suv/er+en/ec

rv_sen_fin(h,subst) <- 'ŝak'/tabul.

rv_sen_fin(h,adv) <- tri+foj. % tri/o estas ankaŭ muzikpeco
rv_sen_fin(h,adv) <- tri/a+foj. % tri/o estas ankaŭ muzikpeco
rv_sen_fin(h,adj) <- tri+tag. % evitu misanalizon trit-ag/
rv_sen_fin(h,pers) <- traf/at. % evitu misanalizon tra/fat/

rv_sen_fin(h,adj) <- unu+tag. % evitu misanalizon trit-ag/

/**
 * esceptoj: tiuj estas tiom maloftaj aŭ esceptaj ke ni hezitas
 * difini por ili gramatikan regulon: tro da reguloj pliigas misanalizojn kaj reduktas
 * la eblecon rekoni erarojn. Esceptan uzon ni ankaŭ ne kuraĝigu per oficiala regulo
 * 'e' = escepto
 */

% id aplikata al lingvo kvazaŭ vivaĵo (best)
rv_sen_fin(e,subst) <- latin/id.
rv_sen_fin(e,subst) <- esperant/id.

rv_sen_fin(e,subst) <- bel~art.

% adverba anst. ellaso aŭ subst. finaĵo ĉe kunderivado/kunmetado

rv_sen_fin(e,tr) <- kun/e~frap.

rv_sen_fin(e,adj) <- mult/e+kost. % pli ĝuste estus mult+kost/a
rv_sen_fin(e,adj) <- mult/e+kolor.
rv_sen_fin(e,adj) <- mult/e+nombr.
rv_sen_fin(e,adj) <- mult/e+sci.
rv_sen_fin(e,adj) <- mult/e+frukt.
rv_sen_fin(e,tr) <- art/e~far. % (art(e)+far)/ita, farita per arto
rv_sen_fin(e,tr) <- prunt/e~don.
rv_sen_fin(e,tr) <- prunt/e~pren.

rv_sen_fin(e,best) <- unu/e~nask/it.

%vorto(e,pron) <- unu/j. % ni aldonis "unu" nun al pronomoj 
vorto(e,prep) <- ek~de. % = "de; eke de"
vorto(e,prep) <- dis~de. % = "de; dise de"
rv_sen_fin(e,adv) <- ĉi-supr. % tio rekonas ĉisupre, sed ne ĉi-supre, verŝajne ni bezonos regulon
        % kiu rekonas ankaŭ ĉi-tiu, ĉi-jare ktp.
vorto(e,adv) <- antaŭ/hieraŭ.
vorto(e,adv) <- post/morgaŭ.


