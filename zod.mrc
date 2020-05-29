; 실행시 설정
on *:START: {
  ; /showmirc -t
  set %banchu off
  set %banchu2 off
  set %tlimiter off
  set %climiter off
  set %slanglimit off
  set %endss off
  ;  if ($asctime(ddd) == sat || $asctime(ddd) == sun) {
  ;    set %endss off
  ;  }
  ; 봇 자동접속
  autoconnect
  nick %esrever
  anick Xeriars
  set %caller on
  계정초기화
  autochampc
  set %igc 1
  set %protc 1
  write -ds status bot.txt
  write bot.txt status 잠수
  set %champ $ini(rank.ini,계정,1)
  inc %champc
  if ($asctime(dd) == 1) { set %maxnick test | set %maxprice 1 | set %minnick test | set %minprice 100000000000 }
  if (($read(bot.txt,s,start) == $true)) {
    서버접속
    halt
  }
  if ($exists(tracking.ini)) { remove tracking.ini }  
}
; 접속 관련
on 1:connect:{
  if ( $network == HanIRC ) { 
    msg ^^ 인증 $id $passwd
    mode $me +x
    myautojoin
    ; 봇 자동접속 관련
    timerautocon 0 120 autocon
    timerautochamp 0 3600 autochampc
    timeritmsply 0 1200 itmsupply
    timerlogout 0 1800 l_logout
    ; timer침공 0 7200 invader
    ; timer침공2 0 6600 bluecast
    set %activatebot off
    set %ivflood off
    timeractivatebot 1 60 activatebot
    write -ds server bot.txt
    write bot.txt server $server
    remini login.ini status
    remini tmp_exp.ini 쿠폰
    remini tmp_exp.ini 쿠폰번호
    ; timerozinger 1 300 server -m irc.ozinger.org
  }
  if ($network == Ozinger) {
    set %oautojoin #Ozinger,#Zod,
    myautojoin
    timerautocon 0 120 autocon
  }
  antiidle
}
; 스크립트가 언로드 됬을시 변수 삭제
on *:unload: {
  window -c @Zodbot
  ; remove bot.txt
  ; unset %server.*
  ; unset %Zodbot.*
  ; unset %bot.*
  sockwrite -nt Zodbot quit :Zodbot Unloaded - Have a Good Time - 
  sockclose Zodbot
  echo -a  %botnick $+ 를 사용해주셔서 감사합니다. 오늘도 즐거운 하루되세요~!
}
; 스크립트가 로드 됬을시 변수 설정
on *:load: {
  set %bot.autojoin #Zod,
  set %Zodbot.info $read(bot.txt,s,hi)
  set %qlimit off
  set %sure off
  set %botnir $read(bot.txt,s,nick)
  set %banchu off
  set %banchu2 off
  set %slang off
  set %ivflood off
  set %ivflood2 off
  set %lmter off 
  set %tcalc 0
  set %fitimer off
  set %activeq off
  set %maxprice 1
  set %maxnick test
  set %minprice 100000000000
  set %minnick test
  set %superno 200901001
  set %caller on
  set %climiter off
  set %slanglimit off
  set %unlimit 1000000000000
  set %querya on
  set %msglock on
  set %msghold on
  set %sameword on
  set %floodcounter off
  set %antifloodu off
  set %esrever Xeriars
  mkdir " $+ $logdirZod $+ "
  echo -a  을 사용해주신걸 감사합니다. 이글이 뜬후 설정에들어갑니다. 설정을 똑바로 해주세요
  echo -a 만약 빵글이 ID 가 없다면 ^^ id , pass 는 그냥 넘어가세요
  echo -a 4설정시 서버에는 포트를 적으지 마십시요. 접속에러납니다.
  ; write bot.txt server $$?="봇이 접속할 서버주소를 입력하세요."
  ; write bot.txt nick $$?="봇의 닉을 입력하세요"
  ; write bot.txt start $input(IRC접속시 봇이 접속시키게 할것입니까?)
  ; set %bot.^^id $?="빵글이 아이디를 적어주세요." | set %bot.^^ps $?="빵글이 암호를 적어주세요."
  ; write bot.txt hi The Blessed, Stand ready. I'm waiting to your command, Master %esrever $+ . ∠(￣へ￣)
  ; write bot.txt bye I will never die, I just fade away for a little to return ∠(￣へ￣)
  ; write bot.txt today $asctime(dd)
  if (%lastcon == $null) {
    set %lastcon 뵤벼뱌배베보버바비뷰부브뱨볘봐봬붜붸뵈뷔븨뾰뼈뺘빼뻬뽀뻐빠삐쀼뿌쁘뺴뼤뽜뽸뿨쀄뾔쀠쁴죠져쟈재제조저자지쥬주즈쟤졔좌좨줘줴죄쥐즤쬬쪄쨔째쩨쪼쩌짜찌쮸쭈쯔쪠쪠쫘쫴쭤쮀쬐쮜쯰됴뎌댜대데도더다디듀두드댸뎨돠돼둬뒈되뒤듸뚀뗘땨때떼또떠따띠뜌뚜뜨떄뗴똬뙈뚸뛔뙤뛰띄교겨갸개게고거가기규구그걔계과괘궈궤괴귀긔꾜껴꺄깨께꼬꺼까끼뀨꾸끄꺠꼐꽈꽤꿔꿰꾀뀌끠쇼셔샤새세소서사시슈수스섀셰솨쇄숴쉐쇠쉬싀쑈쎠쌰쌔쎄쏘써싸씨쓔쑤쓰썌쎼쏴쐐쒀쒜쐬쒸씌묘며먀매메모머마미뮤무므먜몌뫄뫠뭐뭬뫼뮈믜뇨녀냐내네노너나니뉴누느냬녜놔놰눠눼뇌뉘늬요여야애에오어아이유우으얘예와왜워웨외위의료려랴래레로러라리류루르럐례롸뢔뤄뤠뢰뤼릐효혀햐해헤호허하히휴후흐햬혜화홰훠훼회휘희쿄켜캬캐케코커카키큐쿠크컈켸콰쾌쿼퀘쾨퀴킈툐텨탸태테토터타티튜투트턔톄톼퇘퉈퉤퇴튀틔쵸쳐챠채체초처차치츄추츠챼쳬촤쵀춰췌최취츼표펴퍄패페포퍼파피퓨푸프퍠폐퐈퐤풔풰푀퓌픠
  }
  halt
}
; Zodbot 소켓 오픈
on *:sockopen:Zodbot: { 
  set %botnick $read(bot.txt,s,nick)
  set %zonick $rand(a,a) $+ Zod $+ $rand(a,z) $+ $rand(a,z) $+ $rand(1000,9999)
  set %zonick Zod
  .sockwrite -tn Zodbot NICK %zonick
  .sockwrite -nt Zodbot USER Zod Zod Zod :Zod@Zod.zOd.zoD
  set %activatebot off
  timeractivatebot 1 60 activatebot
  unset %deopchan
  unset %deopper
  halt
}
; Zodbot 소켓 읽음 
on *:sockread:Zodbot: {
  ; 모든 토큰은 $strip($1-)로 받게 된다. (흑백처리)
  .sockread %Zodbot.data
  .tokenize 32 $strip($mid($gettok(%Zodbot.data,4-,32),2))
  ; @Zodbot window에 소켓데이터 write
  aline @Zodbot *** Data - %Zodbot.data
  ; 빵글이 로그인 부분
  if (($gettok(%Zodbot.data,2,32) == 255)) {
    if ( $network == HanIRC ) {
      sockwrite -nt Zodbot PRIVMSG ^^ :login $id $passwd
      sockwrite -nt Zodbot PRIVMSG ^-^ 닉복구
      sockwrite -nt Zodbot mode %zonick +x
    }
    sockwrite -tn Zodbot NICK $read(bot.txt,s,nick)
    unset %zonick
  }
  ; $nick, $chan대체 변수
  var %nick = $mid($gettok($gettok(%Zodbot.data,1,32),1,33),2), %chan = $mid($gettok($gettok(%Zodbot.data,3,32),1,33),1)
  ; 핑퐁관련
  if ($gettok(%Zodbot.data,1,32) == PING)  {
    sockwrite -nt $sockname PONG $gettok(%Zodbot.data,2,32)
    halt 
  }
  ; 입장시 발생 이벤트 (on join)
  if (($gettok(%Zodbot.data,2,32) == JOIN)) {
    if (($read(bot.txt,s,nick) !isin $gettok(%Zodbot.data,1,32))) {
      if (($mask($remove($gettok(%Zodbot.data,1,32),:),2) == $address($me,2))) {
        if (%activatebot == on) {
          .privmsg $gettok(%Zodbot.data,3,32) $read(bot.txt,s,hi)
          sockwrite -nt $sockname mode $gettok(%Zodbot.data,3,32) +ov $me $me
        }
        halt
      }
    }
  }
  if ($gettok(%Zodbot.data,2,32) == INVITE) {
    if (%ivflood2 == off) {
      set %ivflood2 on
      sockwrite -nt $sockname notice %nick 초대관련문의: $+ $me
      timerivflood2 1 10 set %ivflood2 off
      halt
    }
  }
  ; 봇이 현재 활성화 되어있는가?
  if (%activatebot == off) {
    halt
  }
  else if (%activatebot == on) {
    if (%usagelimit == 1) {
      timerunset 1 $readini(cmdlimit.ini,%katcom,도움말제한) unset_var
      set %timelset $calc($readini(cmdlimit.ini,%katcom,도움말제한) * $readini(cmdlimit.ini,배수,%chan))
      unset %usagelimit
    }
    if (%slang == on) {
      if ($mid($gettok($gettok(%Zodbot.data,1,32),1,33),2) == %slang.nick) {
        if (%antifloodu == off) {
          if (%floodcounter == off) {
            set %floodcounter on
          }
          if (%floodcounter == on) {
            if (%slangcall > 5) {
              set %antifloodu on
              timerantiflood 1 10 antiflood
              halt
            }
            privmsg $gettok(%Zodbot.data,3,32) $read(slangcombo.txt)
            inc %slangcall
            timeraflooding 1 10 antiflood
            halt
          }
        }
        if (%antifloodu == on) {
          halt
        }
      }
    }
    if ($gettok(%Zodbot.data,2,32) == notice) {
      if (%ivflood == off) {
        set %ivflood on
        var %login.data $gettok(%Zodbot.data,2,58)
        var %login.ip $remove($gettok(%Zodbot.data,1,32),$chr(58))
        var %login.com $gettok(%login.data,1,32)
        var %login.id %nick
        var %login.passwd $gettok(%login.data,2,32)
        if (%login.com == @로그인) {
          if (($readini(login.ini,login,%login.id) == %login.passwd) && ($readini(login.ini,status,%login.id) != ok)) {
            sockwrite -nt $sockname notice %nick 로그인_되었습니다.
            writeini login.ini status %login.id ok
          }
        }
        if (%login.com == @로그아웃) {
          if (($readini(login.ini,login,%login.id) == %login.passwd) && ($readini(login.ini,status,%login.id) == ok)) {
            sockwrite -nt $sockname notice %nick 로그아웃_되었습니다.
            remini login.ini status %login.id
          }
        }
        if (%login.com == @등록) {
          if ($readini(login.ini,login,%login.id)) {
            sockwrite -nt $sockname notice %nick 등록된_계정입니다.
          }        
          if (!$readini(login.ini,login,%login.id)) {
            sockwrite -nt $sockname notice %nick 등록되었습니다.
            writeini login.ini login %login.id %login.passwd
          }
        }
        write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. IP : %login.ip
        timerivflood 1 5 set %ivflood off
      }
      halt
    }
    ; 커맨드 체킹 변수
    set %msgtype $gettok(%Zodbot.data,2,32)
    if (%msgtype != PRIVMSG) { halt }
    if ($mid($1,1,1) != $chr(33) && $mid($1,1,1) != $chr(45) && $mid($1,1,1) != $chr(64)) { halt }
    set %checkerc %chan
    set %checkern %nick
    set %checkera $address(%nick,2)
    set %cmdconvert $replace($1,$chr(45),$chr(64),$chr(33),$chr(64),$chr(61),$chr(64))
    set %katcom2 $1-
    set %rmcmd $mid($1,1,1)
    ; Zod의 쿼리메시지 무시
    if (%checkerc == %botnick) { halt }
    ; 커맨드 체크 (cmdcheck 함수 참고)
    cmdcheck
    ; 블랙리스트 부분
    blackcheck    
    blackadd
    ; echo -a 작동 : %cmdconvert , 메시지 타입 : %msgtype , 명령어명 : %cmdconvert , 작동채널 : %checkerc , 닉 : %checkern , IP : %checkera
    if ($readini(cmdlimit.ini,$remove(%cmdconvert,$chr(64),$chr(33),$chr(45)),시간제한)) {
      ; echo -a %checkerc %checkern %cmdconvert %msgtype
      ; Prefix가 3개(정상상태)가 아닌 1개나 2개일때 비정상적으로 antiflood가 작동하는 문제를 해결한다.
      if ($prefixchk(%chan) == NO) { halt }
      if (%tlimiter == off) {
        set %rep $masking(%chan)
        if (%chan == #Zod) { set %rep %chan }
        set %lasttime $asctime(TT hh:nn:ss)
        antiflooder
      }
      else {
        if (!%tlimiter) { privmsg $gettok(%Zodbot.data,3,32) 주인님 변수설정이 안되있습니다. 시간제한 관련 변수를 설정해주세요 }
        if (%tlimiter == on) {
          ; $me 일경우 타임리미터 무시
          if ($readini(admin.ini,ip,$address(%nick,2)) == 1) { goto startscript }
          else {
            ; 타이머가 활성화 되어있다면 다음과 같은 에러를 출력
            if (%slanglimit == on) { privmsg $gettok(%Zodbot.data,3,32) %rep $+ 채널에서 사용 할 수 없는 단어가 포함된 명령이 사용되었으므로 %timelset $+ 초간 명령어를 제한합니다. 4(남은시간 $timer(unset).secs $+ 초, Count $calc(%tcalc + 1) $+ ) }
            else {
              if (%tcalc != 3) { privmsg $gettok(%Zodbot.data,3,32) %timelset $+ 초에 한번씩만 명령어를 사용합시다. ( $+ %lasttime $+ $chr(44) %rep - 4남은시간 $timer(unset).secs $+ 초, Count $calc(%tcalc + 1) $+ 1) }
              if (%tcalc == 2) { privmsg $gettok(%Zodbot.data,3,32) 4Count가 4가 되면 10분간 사용이 금지되니 주의해주세요! }
            }
            inc %tcalc
            if (%tcalc == 4) {
              privmsg $gettok(%Zodbot.data,3,32) 4과부하 방지를 위해 지금부터 %chan $+ 채널은 1분간, $nickdt(%nick) $+ 님은 10분 동안 Zod의 사용이 중지됩니다.
              writeini -n cmdlimit.ini 전체 %chan 1
              timer금지 $+ %chan 1 60 remini cmdlimit.ini 전체 %chan
              set %activatebot off
              timerZod활성화 1 10 set %activatebot on
              sockwrite -nt $sockname notice $me : $+ 주인님 %chan $+ 채널에서 %nick $+ 님 때문에 잠수중입니다.
              if ($readini(admin.ini,IP,$address(%nick,2)) == 1) {
                sockwrite -nt $sockname notice %nick : $+ 운영자 계정은 무시목록에 포함되지 않습니다. 10초 후 부터 다시 이용가능합니다.
                goto ignorepass
              }
              writeini -n caction.ini 영구블랙 $address(%nick,2) 1
              timer금지 $+ %nick 1 600 remini caction.ini 영구블랙 $address(%nick,2)
              :ignorepass
              set %tcalc 0
            }
            halt
          }
        }
      }
    }
    ; 스크립트 시작
    :startscript
    if (!$readini(prefix.ini,%chan,p1)) {
      if (!%cerror) { privmsg $gettok(%Zodbot.data,3,32) 채널정보가 없어서 Zod를 사용할 수 없습니다. }
      unset_var
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 도움말 || $1 == $readini(prefix.ini,%chan,p2) $+ 도움말 || $1 == $readini(prefix.ini,%chan,p3) $+ 도움말 || $1 == $readini(prefix.ini,%chan,p1) $+ 명령어 || $1 == $readini(prefix.ini,%chan,p2) $+ 명령어 || $1 == $readini(prefix.ini,%chan,p3) $+ 명령어) {
      var %i 3
      while (%i < $ini(cmdlimit.ini,0)) {
        inc %i
        if ($readini(cmdlimit.ini,$ini(cmdlimit.ini,%i),%chan) == 1) {
          inc %i
        }
        if (%i <= 50) {
          var %helpresult %helpresult $ini(cmdlimit.ini, $+ %i $+ ) $+ $chr(44)
        }
        if (%i > 51) {
          var %helpresult2 %helpresult2 $ini(cmdlimit.ini, $+ %i $+ ) $+ $chr(44)
        }
      }
      if ($readini(cmdlimit.ini,전체,%chan) == 1) { var %helpresult 이 채널은 Zod의 사용이 금지된 채널입니다. | var %i 0 }
      var %u 0
      while (%u <= $ini(prefix.ini,%chan,0)) {
        inc %u
        var %presult %presult $+ $chr(44) $+ $readini(prefix.ini,%chan,$ini(prefix.ini,%chan,%u))
      }
      sockwrite -nt $sockname notice %nick : $+ %chan $+ 채널에서 사용 할 수 있는 명령목록은 다음과 같습니다.
      sockwrite -nt $sockname notice %nick : $+ %helpresult
      if (%i > 50) {
        sockwrite -nt $sockname notice %nick : $+ $remove(%helpresult2,사용량제한 $+ $chr(44),전체 $+ $chr(44))
      }
      if ($readini(cmdlimit.ini,전체,%chan) != 1) { 
        sockwrite -nt $sockname notice %nick : $+ 이 채널에서 가능한 명렁어 접두어는 $mid(%presult,2) $+ 입니다. (ex : $uiif($readini(prefix.ini,%chan,p1),$readini(prefix.ini,%chan,p2),$readini(prefix.ini,%chan,p3)) $+ 명령어)
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 비만계산 || $1 == $readini(prefix.ini,%chan,p2) $+ 비만계산 || $1 == $readini(prefix.ini,%chan,p3) $+ 비만계산) {
      if ((!$2) || (!$3)) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,비만계산,설명) | set %usagelimit 1 | halt }
      if (($2 !isnum) || ($3 !isnum)) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,비만계산,설명) | set %usagelimit 1 | halt }
      var %fatcalc $calc($3 / ($2 / 100) / ($2 / 100))
      if ($2 > 300) { privmsg $gettok(%Zodbot.data,3,32) 미친 빌어먹을 자이언트새퀴.. 꺼져 임마! | halt }
      if ($3 > 300) { privmsg $gettok(%Zodbot.data,3,32) 돼지새퀴... 뭘쳐먹으면 몸무게가 그따위냐? | halt }
      if (%fatcalc < 10) { var %fstatus 4심각한 저체중 }
      if (%fatcalc < 0) { var %fstatus 4숫자 이상하게 입력하면 뒤진다? }
      if (%fatcalc isnum 10-18.5) { var %fstatus 10저체중 }
      if (%fatcalc isnum 18.5-23) { var %fstatus 3정상 }
      if (%fatcalc isnum 23-25) { var %fstatus 5과체중 }
      if (%fatcalc isnum 25-30) { var %fstatus 6비만 }
      if (%fatcalc isnum 30-35) { var %fstatus 13중도비만 }
      if (%fatcalc isnum 35-40) { var %fstatus 7고도비만 }
      if (%fatcalc isnum 40-100) { var %fstatus 4위험수위!! }
      if (%fatcalc > 100) { var %fstatus 4꼭 숫자를 요따위로 입력하는 싸이코 새퀴들이 있지.. ㅉㅉ }
      if (%fatcalc isnum 20-25) { var %mstatus 12(1급 현역)1 }
      if (%fatcalc isnum 25-30 || %fatcalc isnum 18.5-20) { var %mstatus 12(2급 현역)1 }
      if (%fatcalc isnum 30-35 || %fatcalc isnum 17-18.5) { var %mstatus 12(3급 현역)1 }
      if (%fatcalc > 35 || %fatcalc < 17) { var %mstatus 13(4급 보충역)1 }
      if (!%fatcalc) { var %fstatus 측정불가 | var %mstatus 측정불가 }
      privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님의 비만도 수치는 %fatcalc $+ (BMI 기준)이며 측정 상태는 %fstatus $+ %mstatus $+ 입니다.
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 주민생성 || $1 == $readini(prefix.ini,%chan,p2) $+ 주민생성 || $1 == $readini(prefix.ini,%chan,p3) $+ 주민생성) {
      if (!$readini(caction.ini,주민생성,$address(%nick,2))) { privmsg $gettok(%Zodbot.data,3,32) 사용권한이 없습니다. | set %usagelimit 1 | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) 사용법 : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 남자 Option $chr(60) $+ 2000(2000년 이후 출생자) $chr(124) 외국인 $+ $chr(62) | set %usagelimit 1 | halt }
      elseif ($3 != $null) {
        if ($3 == 남자) {
          goto kgen
        }
        elseif ($3 == 여자) {
          goto kgen
        }
        else { privmsg $gettok(%Zodbot.data,3,32) 성별을 지정하여 주시기 바랍니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 여자) | set %usagelimit 1 | halt }
      }
      elseif (!$3) { privmsg $gettok(%Zodbot.data,3,32) 성별을 지정하여 주시기 바랍니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 여자) | set %usagelimit 1 | halt }
      :kgen
      if ($len($2) != 6) { privmsg $gettok(%Zodbot.data,3,32) 생년월일 자릿수가 틀립니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 남자) | set %usagelimit 1 | halt }
      elseif ($mid($2,3,1) > 1) { privmsg $gettok(%Zodbot.data,3,32) 생년월일의 지정이 틀립니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 여자) | set %usagelimit 1 | halt }
      elseif ($mid($2,3,1) == 1) {
        if ($mid($2,4,1) > 2) { 
          privmsg $gettok(%Zodbot.data,3,32) 생년월일의 지정이 틀립니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 여자) | set %usagelimit 1 | halt
        }
      }
      elseif ($mid($2,5,1) == 3) {
        if ($mid($2,6,1) > 1) {  privmsg $gettok(%Zodbot.data,3,32) 생년월일의 지정이 틀립니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민생성 123456 여자) | set %usagelimit 1 | halt }
      }
      var %kc1 $rand(0,9)
      var %kc2 $rand(0,9)
      var %kc3 $rand(0,9)
      var %kc4 $rand(0,9)
      var %kc5 $rand(0,9)
      if ($4 == 2000) {
        var %kcode $calc(11 - $calc($calc($calc($mid($2,1,1) * 2) + $calc($mid($2,2,1) * 3) + $calc($mid($2,3,1) * 4) + $calc($mid($2,4,1) * 5) + $calc($mid($2,5,1) * 6) + $calc($mid($2,6,1) * 7) + $calc($replace($3,남자,3,여자,4) * 8) + $calc(%kc1 * 9) + $calc(%kc2 * 2) + $calc(%kc3 * 3) + $calc(%kc4 * 4) + $calc(%kc5 * 5)) % 11))
        if (%kcode == 10) {
          var %kcode 0
        }
        elseif (%kcode == 11) {
          var %kcode 1
        }
        var %kcresult 생성된 주민번호는 $mid($2,1,1) $+ $mid($2,2,1) $+ $mid($2,3,1) $+ $mid($2,4,1) $+ $mid($2,5,1) $+ $mid($2,6,1) $+ - $+ $replace($3,남자,3,여자,4) $+ %kc1 $+ %kc2 $+ %kc3 $+ %kc4 $+ %kc5 $+ %kcode $+ 입니다. ( $+ $3 - 2000년 이후 출생)
        sockwrite -nt $sockname notice %nick : $+ %kcresult
        privmsg $gettok(%Zodbot.data,3,32) 생성 결과를 $nickdt(%nick) $+ 님께 출력하였습니다.
        write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 생성된값 : %kcresult
      }
      if ($4 == 1800) {
        var %kcode $calc(11 - $calc($calc($calc($mid($2,1,1) * 2) + $calc($mid($2,2,1) * 3) + $calc($mid($2,3,1) * 4) + $calc($mid($2,4,1) * 5) + $calc($mid($2,5,1) * 6) + $calc($mid($2,6,1) * 7) + $calc($replace($3,남자,9,여자,0) * 8) + $calc(%kc1 * 9) + $calc(%kc2 * 2) + $calc(%kc3 * 3) + $calc(%kc4 * 4) + $calc(%kc5 * 5)) % 11))
        if (%kcode == 10) {
          var %kcode 0
        }
        elseif (%kcode == 11) {
          var %kcode 1
        }
        var %kcresult 생성된 주민번호는 $mid($2,1,1) $+ $mid($2,2,1) $+ $mid($2,3,1) $+ $mid($2,4,1) $+ $mid($2,5,1) $+ $mid($2,6,1) $+ - $+ $replace($3,남자,9,여자,0) $+ %kc1 $+ %kc2 $+ %kc3 $+ %kc4 $+ %kc5 $+ %kcode $+ 입니다. ( $+ $3 - 1800년 이후 출생)
        sockwrite -nt $sockname notice %nick : $+ %kcresult
        privmsg $gettok(%Zodbot.data,3,32) 생성 결과를 $nickdt(%nick) $+ 님께 출력하였습니다.
        write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 생성된값 : %kcresult
      }
      elseif ($4 == 외국인) {
        if ($mid($2,1,1) == 0) {
          var %forei $replace($3,남자,7,여자,8)
        }
        else {
          var %forei $replace($3,남자,5,여자,6)
        }
        var %kcode $calc(11 - $calc($calc($calc($mid($2,1,1) * 2) + $calc($mid($2,2,1) * 3) + $calc($mid($2,3,1) * 4) + $calc($mid($2,4,1) * 5) + $calc($mid($2,5,1) * 6) + $calc($mid($2,6,1) * 7) + $calc(%forei * 8) + $calc(%kc1 * 9) + $calc(%kc2 * 2) + $calc(%kc3 * 3) + $calc(%kc4 * 4) + $calc(%kc5 * 5)) % 11))
        if (%kcode == 10) {
          var %kcode 0
        }
        elseif (%kcode == 11) {
          var %kcode 1
        }
        var %kcresult 생성된 주민번호는 $mid($2,1,1) $+ $mid($2,2,1) $+ $mid($2,3,1) $+ $mid($2,4,1) $+ $mid($2,5,1) $+ $mid($2,6,1) $+ - $+ %forei $+ %kc1 $+ %kc2 $+ %kc3 $+ %kc4 $+ %kc5 $+ %kcode $+ 입니다. ( $+ $3 - 외국인)
        sockwrite -nt $sockname notice %nick : $+ %kcresult
        privmsg $gettok(%Zodbot.data,3,32) 생성 결과를 $nickdt(%nick) $+ 님께 출력하였습니다.
        write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 생성된값 : %kcresult
      }
      else {
        var %kcode $calc(11 - $calc($calc($mid($2,1,1) * 2) + $calc($mid($2,2,1) * 3) + $calc($mid($2,3,1) * 4) + $calc($mid($2,4,1) * 5) + $calc($mid($2,5,1) * 6) + $calc($mid($2,6,1) * 7) + $calc($replace($3,남자,1,여자,2) * 8) + $calc(%kc1 * 9) + $calc(%kc2 * 2) + $calc(%kc3 * 3) + $calc(%kc4 * 4) + $calc(%kc5 * 5)) % 11))
        if (%kcode == 10) {
          var %kcode 0
        }
        elseif (%kcode == 11) {
          var %kcode 1
        }
        var %kcresult 생성된 주민번호는 $mid($2,1,1) $+ $mid($2,2,1) $+ $mid($2,3,1) $+ $mid($2,4,1) $+ $mid($2,5,1) $+ $mid($2,6,1) $+ - $+ $replace($3,남자,1,여자,2) $+ %kc1 $+ %kc2 $+ %kc3 $+ %kc4 $+ %kc5 $+ %kcode $+ 입니다. ( $+ $3 - 일반)
        sockwrite -nt $sockname notice %nick : $+ %kcresult
        privmsg $gettok(%Zodbot.data,3,32) 생성 결과를 $nickdt(%nick) $+ 님께 출력하였습니다.
        write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 생성된값 : %kcresult
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 주민검사 || $1 == $readini(prefix.ini,%chan,p2) $+ 주민검사 || $1 == $readini(prefix.ini,%chan,p3) $+ 주민검사) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) 검사할 주민등록번호가 없습니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민검사 123456-1234567) | set %usagelimit 1 | halt }
      elseif ($len($2) != 14) { privmsg $gettok(%Zodbot.data,3,32) 생년월일 자릿수가 틀립니다. (ex : $readini(prefix.ini,%chan,p1) $+ 주민검사 123456-1234567) | set %usagelimit 1 | halt }
      var %kcode $calc(11 - $calc($calc($mid($2,1,1) * 2) + $calc($mid($2,2,1) * 3) + $calc($mid($2,3,1) * 4) + $calc($mid($2,4,1) * 5) + $calc($mid($2,5,1) * 6) + $calc($mid($2,6,1) * 7) + $calc($mid($2,8,1) * 8) + $calc($mid($2,9,1) * 9) + $calc($mid($2,10,1) * 2) + $calc($mid($2,11,1) * 3) + $calc($mid($2,12,1) * 4) + $calc($mid($2,13,1) * 5)) % 11))
      if (%kcode == 10) {
        var %kcode 0
      }
      elseif (%kcode == 11) {
        var %kcode 1
      }
      var %male1 남자 - 일반
      var %female1 여자 - 일반
      var %male2 남자 - 2000년 이후 출생자
      var %female2 남자 - 2000년 이후 출생자
      var %male3 남자 - 외국인
      var %female3 여자 - 외국인
      var %male4 남자 - 외국인, 2000년 이후 출생자
      var %female4 여자 - 외국인, 2000년 이후 출생자
      var %male5 남자 - 1800~1899년 출생자
      var %female5 여자 - 1800~1899년 출생자
      var %ssx $replace($mid($2,8,1),1, $+ %male1 $+ ,2, $+ %female1 $+ ,3, $+ %male2 $+ ,4, $+ %female2 $+ ,5, $+ %male3 $+ ,6, $+ %female3 $+ ,7, $+ %male4 $+ ,8, $+ %female4 $+ ,9, $+ %male5 $+ ,0, $+ %female5 $+ )
      if ($mid($2,14,1) == %kcode) {
        privmsg $gettok(%Zodbot.data,3,32) 주민등록번호 $2 $+ 는 올바른 주민등록번호 입니다. ( $+ 성별 : %ssx $+ )
        halt
      }
      else {
        privmsg $gettok(%Zodbot.data,3,32) 주민등록번호 $2 $+ 는 올바른 주민등록번호가 아닙니다.
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 주사위 || $1 == $readini(prefix.ini,%chan,p2) $+ 주사위 || $1 == $readini(prefix.ini,%chan,p3) $+ 주사위) {
      privmsg $gettok(%Zodbot.data,3,32) 주사위가 굴러갑니다~ $rand(1,100) 이 나왓네요. 
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 요리검색 || $1 == $readini(prefix.ini,%chan,p2) $+ 요리검색 || $1 == $readini(prefix.ini,%chan,p3) $+ 요리검색) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 요리검색 이름”과 같은 형식으로 입력하셔야 합니다. 리스트를 검색시에는 "요리검색 리스트"로 검색해주시기 바랍니다. | set %usagelimit 1 | halt }
      else {
        if ($2 == 리스트) {
          var %i 1
          while (%i <= $ini(cook.ini,0)) {
            var %cooklist %cooklist $+ $ini(cook.ini, $+ %i $+ ) $+ $chr(44)
            inc %i
          }
          privmsg $gettok(%Zodbot.data,3,32) 현재 검색가능한 조리법은 %cooklist 입니다.
          halt
        }
        if (!$readini(cook.ini,$2-,1)) { privmsg $gettok(%Zodbot.data,3,32) $josa($2-,은는) 아직 추가된 요리법이 아닙니다. | halt }
        var %i 1
        while (%i <= $ini(cook.ini,$2,0)) {
          privmsg $gettok(%Zodbot.data,3,32) $readini(cook.ini,$2,%i)
          inc %i
        }
        halt
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 키젠 || $1 == $readini(prefix.ini,%chan,p2) $+ 키젠 || $1 == $readini(prefix.ini,%chan,p3) $+ 키젠) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) 생성할 개체가 필요합니다. | set %usagelimit 1 | halt }
      if ($2 == 스타) {
        var %i 1
        while (%i <= 12) {
          var %cdkey %cdkey $+ $rand(0,9)
          inc %i
        }
        var %cdkey %cdkey $+ $starkey(%cdkey)
        var %result $left(%cdkey,4) $+ $chr(45) $+ $mid(%cdkey,5,5) $+ $chr(45) $+ $right(%cdkey,4)
        privmsg $gettok(%Zodbot.data,3,32) Generated Starcraft CD-KEY : %result (배틀넷은 불가능합니다.)
        halt
      }
      if ($2 == winxp) {
        privmsg $gettok(%Zodbot.data,3,32) Generated Windows XP Prof. VLK. : $read(winkey.txt) 
        halt
      }
      if ($2 == win2003) {
        privmsg $gettok(%Zodbot.data,3,32) Generated Windows Server 2003. VLK. : $read(win2003.txt) 
        halt
      }
      if ($2 == vmware) {
        privmsg $gettok(%Zodbot.data,3,32) Generated VMware Workstation ACE Edition for Win. V6 : $read(vm.txt) 
        halt
      }
      if ($2 == 엔진) {
        privmsg $gettok(%Zodbot.data,3,32) Generated Engine : $amgine($3) 
        halt      
      }
      if ($2 == 문상) {
        privmsg $gettok(%Zodbot.data,3,32) Generated Number : B $+ $rand(A,Z) $+ 1 $+ $rand(1,9) $+ - $+ $replace($rand(1111,9999),$chr(48),$rand(1,9)) $+ - $+ $replace($rand(1111,9999),$chr(48),$rand(1,9)) $+ - $+ $replace($rand(111111,999999),$chr(48),$rand(1,9)) 
        halt      
      }
      else { privmsg $gettok(%Zodbot.data,3,32) " $+ $2 $+ "의 키젠 기능은 지원하지 않습니다. | set %usagelimit 1 | halt }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 키확인 || $1 == $readini(prefix.ini,%chan,p2) $+ 키확인 || $1 == $readini(prefix.ini,%chan,p3) $+ 키확인) {
      if ($2 == 스타) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) 시디키를 입력하세요. | set %usagelimit 1 | halt }
        if ($len($3) != 15) { privmsg $gettok(%Zodbot.data,3,32) 시디키의 형식이 잘못된것 같습니다. 형식 : 1234-12345-1234 | set %usagelimit 1 | halt }
        if ($len($remove($3,$chr(45))) != 13) { privmsg $gettok(%Zodbot.data,3,32) 시디키의 형식이 잘못된것 같습니다. 형식 : 1234-12345-1234 | set %usagelimit 1 | halt }
        var %cdkey $remove($3,$chr(45))
        var %i 1
        while (%i <= 13) {
          if ($mid(%cdkey,%i,1) !isnum) { privmsg $gettok(%Zodbot.data,3,32) 시디키의 형식이 잘못된것 같습니다. 형식 : 1234-12345-1234 | halt }
          inc %i
        }
        if ($starkey($remove($3,$chr(45))) == $right($3,1)) { privmsg $gettok(%Zodbot.data,3,32) 입력하신 시디키는 올바른 시디키입니다. | halt }
        else {
          var %tmp $left($remove($3,$chr(45)),12) $+ $starkey($remove($3,$chr(45)))
          var %result $left(%tmp,4) $+ $chr(45) $+ $mid(%tmp,5,5) $+ $chr(45) $+ $right(%tmp,4)
          privmsg $gettok(%Zodbot.data,3,32) 입력하신 시디키는 %result 가 되어야 올바른 시디키 입니다.
          halt
        }
      }
      else {
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,키확인,설명) | set %usagelimit 1
        halt
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 자반검색 || $1 == $readini(prefix.ini,%chan,p2) $+ 자반검색 || $1 == $readini(prefix.ini,%chan,p3) $+ 자반검색) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 자반검색 이름”과 같은 형식으로 입력하셔야 합니다. 리스트를 검색시에는 " $+ $readini(prefix.ini,%chan,p1) $+ 자반검색 리스트"로 검색해주시기 바랍니다. | set %usagelimit 1 | halt }
      else {
        if ($2 == 리스트) {
          var %i 1
          while (%i <= $ini(automsg.ini,0)) {
            var %amsgfish %i
            if (%i < 50) { var %amsglist %amsglist $+ $ini(automsg.ini, $+ %i $+ ) $+ $chr(44) | inc %i }
            if (%i >= 50) { var %amsglist2 %amsglist2 $+ $ini(automsg.ini, $+ %i $+ ) $+ $chr(44) | inc %i }
          }
          if (%amsgfish >= 50) {
            privmsg $gettok(%Zodbot.data,3,32) 현재 검색가능한 자동반응은 %amsglist
            privmsg $gettok(%Zodbot.data,3,32) %amsglist2 입니다. 총 $ini(automsg.ini,0) $+ 건이 낚임.
            halt
          }
          privmsg $gettok(%Zodbot.data,3,32) 현재 검색가능한 자동반응은 %amsglist 입니다. 총 $ini(automsg.ini,0) $+ 건이 낚임.
          halt
        }
        if (!$readini(automsg.ini,$2,1)) { privmsg $gettok(%Zodbot.data,3,32) $josa($2,은는) 아직 추가된 자동반응이 아닙니다. | halt }
        var %i 1
        while (%i <= $ini(automsg.ini,$2,0)) {
          privmsg $gettok(%Zodbot.data,3,32) 1 $readini(automsg.ini,$2,%i)
          inc %i
        }
        halt
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 암호생성 || $1 == $readini(prefix.ini,%chan,p2) $+ 암호생성 || $1 == $readini(prefix.ini,%chan,p3) $+ 암호생성) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,암호생성,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,암호생성,설명) | set %usagelimit 1 | halt }
      if ($3 > 255) { privmsg $gettok(%Zodbot.data,3,32) 생성하려는 암호길이가 너무 깁니다. | halt }
      if (($2 !isnum) || ($3 !isnum)) { privmsg $gettok(%Zodbot.data,3,32) 올바른 입력값이 아닙니다. 다시 한번 확인해 주시기 바랍니다. | halt }
      set %lots $2
      var %i 0
      charselect
      while (%i < $3) {
        charselect
        if (%rangec1) {
          if (%rangec2) {
            var %rchar = $rand(%rangec1,%rangec2)
            var %result %result $+ $chr(%rchar)
            inc %i
          }
        }
        else {
          privmsg $gettok(%Zodbot.data,3,32) 올바른 암호종류가 아닙니다.
          privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,암호생성,설명)
          set %usagelimit 1
          halt
        }
      }
      privmsg $gettok(%Zodbot.data,3,32) 생성결과 : %result
      unset %lots %rangec1 %rangec2
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 메시지 || $1 == $readini(prefix.ini,%chan,p2) $+ 메시지 || $1 == $readini(prefix.ini,%chan,p3) $+ 메시지) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,메시지,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,메시지,설명) | set %usagelimit 1 | halt }      
      if ($len($3-) > 50) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,메시지,설명) | set %usagelimit 1 | halt }
      if ($2 == 1) {
        privmsg $gettok(%Zodbot.data,3,32) 15,15............... $+ $3- *15,15................
        privmsg $gettok(%Zodbot.data,3,32) 15,15...........2,2.... $+ $3- *2,2....15,15............
        privmsg $gettok(%Zodbot.data,3,32) 15,15...........2,2....11,2 $+ $3- *2,2....1,1..15,15..........
        privmsg $gettok(%Zodbot.data,3,32) 15,15...........2,2.... $+ $3- *2,2....1,1..15,15..........
        privmsg $gettok(%Zodbot.data,3,32) 15,15.............1,1.... $+ $3- *1,1....15,15..........
        privmsg $gettok(%Zodbot.data,3,32) 15,15............... $+ $3- *15,15................
        halt
      }
      if ($2 == 2) {
        privmsg $gettok(%Zodbot.data,3,32) 13,13.. $3- ..
        privmsg $gettok(%Zodbot.data,3,32) 13,13..8,13 $3- 13,13..14,14..
        privmsg $gettok(%Zodbot.data,3,32) 13,13.. $3- ..14,14..
        privmsg $gettok(%Zodbot.data,3,32) 0,0..14,14.. $3- ..
      }
      if ($2 == 3) {
        privmsg $gettok(%Zodbot.data,3,32) 12,12...... $3- .....
        privmsg $gettok(%Zodbot.data,3,32) 12,12...15,15.. $3- ...12,12...15,15..
        privmsg $gettok(%Zodbot.data,3,32) 12,12...15,15..2,0 $3- 0,0...12,12...15,15..
        privmsg $gettok(%Zodbot.data,3,32) 12,12...15,15..0,0..15,0 $3- 0,0.12,12...15,15..
        privmsg $gettok(%Zodbot.data,3,32) 12,12...... $3- .....15,15..
        privmsg $gettok(%Zodbot.data,3,32) 0,0..15,15.. $3- .........
      }
      if ($2 == 4) {
        privmsg $gettok(%Zodbot.data,3,32) 1,1.8,8.1,1.8,8.1,1.12,12.. $3- ..1,1.8,8.1,1.8,8.1,1.
        privmsg $gettok(%Zodbot.data,3,32) 1,1.8,8.1,1.8,8.1,1.12,12..8,12 $3- 12,12..1,1.8,8.1,1.8,8.1,1.4,4..
        privmsg $gettok(%Zodbot.data,3,32) 1,1.8,8.1,1.8,8.1,1.12,12.. $3- ..1,1.8,8.1,1.8,8.1,1.4,4..
        privmsg $gettok(%Zodbot.data,3,32) 0,0..4,4....... $3- .......
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 궁합 || $1 == $readini(prefix.ini,%chan,p2) $+ 궁합 || $1 == $readini(prefix.ini,%chan,p3) $+ 궁합) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,궁합,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,궁합,설명) | set %usagelimit 1 | halt }
      if ($2 == $3) { privmsg $gettok(%Zodbot.data,3,32) 뭐여 지금.. 클론의 습격이여? 아니면 복제양 돌리여? 뭐여? 왜 둘이 이름이 같어? | set %usagelimit 1 | halt }
      if ($4-) { privmsg $gettok(%Zodbot.data,3,32) 이 바보가 삼각관계 이상의 궁합을 봐달라네.. -_-; | halt }
      if (%nick != $me && $readini(admin.ini,ip,$address(%nick,2)) != 1) {
        if ($me isin $2 || $me isin $3) { if ($3 != %botnick) { if ($2 != %botnick) { privmsg $gettok(%Zodbot.data,3,32) 무엄하다! 그런 천박한 녀석을 주인님과 비교하려 하다니!! | halt } } }
      }
      var %statnick1 $md5($2) | var %statnick2 $md5($3)
      var %ornick1 $2 | var %ornick2 $3
      var %j 0
      while (%j <= $len(%statnick1)) {
        inc %j
        if ($mid(%statnick1,%j,1) isnum) {
          var %resultnick1 $calc(%resultnick1 + $mid(%statnick1,%j,1))
        }
      }
      var %j 0
      while (%j <= $len(%statnick2)) {
        inc %j
        if ($mid(%statnick2,%j,1) isnum) {
          var %resultnick2 $calc(%resultnick2 + $mid(%statnick2,%j,1))
        }
      }
      while (100 < %resultnick1) { var %resultnick1 $calc(%resultnick1 - 100) }
      while (100 < %resultnick2) { var %resultnick2 $calc(%resultnick2 - 100) }
      if ($2 == 하코) { var %resultnick1 90 }            
      if ($3 == 하코) { var %resultnick2 90 }
      if ($2 == 김영아) { var %resultnick1 90 }            
      if ($3 == 김영아) { var %resultnick2 90 }
      if ($2 == 영아) { var %resultnick1 90 }            
      if ($3 == 영아) { var %resultnick2 90 }
      var %result $calc((%resultnick1 / 2 * 0.99) + (%resultnick2 / 2 * 0.99))
      var %mind1 $calc(%resultnick1 * 0.99)
      var %mind2 $calc(%resultnick2 * 0.99)

      if (%result > 100) { var %result $calc(%result - 100) }
      if (($2 == $me && $3 == Zod) || ($2 == Zod && $3 == $me)) {
        var %result 99.99
        var %mind1 99.99
        var %mind2 99.99
      }
      if ($2 == Xeriars || $3 == Xeriars || $2 == 경수 || $3 == 경수 || $2 == 고경수 || $3 == 고경수) {
        var %result 99.00
        var %mind1 99 / 2
        var %mind2 99 / 2
      }      
      var %print $percent($mid(%result,1,5),100,60)
      var %stat $gdescriminator(%result)
      privmsg $gettok(%Zodbot.data,3,32)  $+ $nickdt($2) $+ 님(호감지수 : %mind1 $+ )과 $nickdt($3) $+ 님(호감지수 : %mind2 $+ )의 궁합 측정치는 %print 1,0 입니다. (진단결과 : %stat $+ )

    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 봇상태 || $1 == $readini(prefix.ini,%chan,p2) $+ 봇상태 || $1 == $readini(prefix.ini,%chan,p3) $+ 봇상태) {
      var %statnick $md5(%nick)
      var %ornick %nick
      if ($2) { var %statnick $md5($2) | var %ornick $2 }
      var %j 0
      while (%j <= $len(%statnick)) {
        inc %j
        if ($mid(%statnick,%j,1) isnum) {
          var %resultnick $calc(%resultnick + $mid(%statnick,%j,1))
        }
      }
      while (100 < %resultnick) {
        var %resultnick $calc(%resultnick - 100)
        inc %t
      }
      if (%resultnick == 100) { var %resultnick $calc(%resultnick - 1) }
      var %per %resultnick
      if ($len(%per) == 1) { var %per 0 $+ %per }
      if (%nick == $me) { var %per 100 }
      var %result $percent(%per,100,70)
      privmsg $gettok(%Zodbot.data,3,32) 이름 : %botnick , 나이 : 여섯쨜~* , 키 : 180cm(Loser), 현재상태 : %botfeel
      privmsg $gettok(%Zodbot.data,3,32) $nickdt(%ornick) $+ 님과의 호감도 : %result
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 대학 || $1 == $readini(prefix.ini,%chan,p2) $+ 대학 || $1 == $readini(prefix.ini,%chan,p3) $+ 대학) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,대학,설명) | set %usagelimit 1 | halt }
      if ($me isin $2-) { privmsg $gettok(%Zodbot.data,3,32) 뒷조사 할 생각 말고 썩 꺼지도록! | set %usagelimit 1 | halt }
      if (%botnick isin $2-) { privmsg $gettok(%Zodbot.data,3,32) 뒷조사 할 생각 말고 썩 꺼지도록! | set %usagelimit 1 | halt }
      var %result $read(univ.txt)
      if ($2 == 배재터) { var %result 배재대학교 (대전) }
      if ($rand(1,50) == 1) { var %result 낙성대학교 (서울) }
      privmsg $gettok(%Zodbot.data,3,32) $nickdt($2) $+ 의 실력으로 갈 수 있는 대학교육기관은 %result $+  인 듯 하다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 배우자 || $1 == $readini(prefix.ini,%chan,p2) $+ 배우자 || $1 == $readini(prefix.ini,%chan,p3) $+ 배우자) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,배우자,설명) | set %usagelimit 1 | halt }
      if ($me isin $2-) { privmsg $gettok(%Zodbot.data,3,32) 주인님은 모든 여인의 남친이다. 뒷조사 할 생각 말고 썩 꺼지도록! | set %usagelimit 1 | halt }
      if (%botnick isin $2-) { privmsg $gettok(%Zodbot.data,3,32) 나는 만인의 연인이다. 뒷조사 할 생각 말고 썩 꺼지도록! | set %usagelimit 1 | halt }
      var %statnick $md5($2)
      var %i 0
      var %couple 1
      while (%i <= $len(%statnick)) {
        inc %i
        if (($mid(%statnick,%i,1) isnum) && ($mid(%statnick,%i,1) != $chr(48))) {
          var %couple $calc(%couple * $mid(%statnick,%i,1) * $asctime(dd))
        }
      }
      if (%couple > $lines(couple.txt)) { var %couple $calc(%couple % $lines(couple.txt)) }
      if (%couple == 0) { var %couple 1 }
      var %result $read(couple.txt,%couple)
      if ($2 == 수로) { var %result 홍석천 }

      privmsg $gettok(%Zodbot.data,3,32) $nickdt($2) $+ 님의 미래 배우자는 $josa($read(5form.txt),이가) $josa(%result,과와) 닮은 꼴 입니다.
      halt
    }
    if ($1 == !cmd) { if (%nick != $me) { halt }
      privmsg $gettok(%Zodbot.data,3,32) 요청된 작업이 수행되었습니다. ( $+ $2- $+ )
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 최고가 || $1 == $readini(prefix.ini,%chan,p2) $+ 최고가 || $1 == $readini(prefix.ini,%chan,p3) $+ 최고가) {
      privmsg $gettok(%Zodbot.data,3,32) 현재 $nickdt(%maxnick) $+ 님이 $comgen(%maxprice) $+ 원 에 팔리는 최고가 상품입니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 최저가 || $1 == $readini(prefix.ini,%chan,p2) $+ 최저가 || $1 == $readini(prefix.ini,%chan,p3) $+ 최저가) {
      privmsg $gettok(%Zodbot.data,3,32) 현재 $nickdt(%minnick) $+ 님이 $comgen(%minprice) $+ 원 에 팔리는 최저가 상품입니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 가격비교 || $1 == $readini(prefix.ini,%chan,p2) $+ 가격비교 || $1 == $readini(prefix.ini,%chan,p3) $+ 가격비교) {
      if (!$2) || (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,가격비교,설명) | set %usagelimit 1 | halt }
      if ($4-) { privmsg $gettok(%Zodbot.data,3,32) 비교는 두개로 추려서 합시다. | set %usagelimit 1 | halt }
      if ($len($3) > 255) { privmsg $gettok(%Zodbot.data,3,32) 물건 이름의 길이가 너무 깁니다.  | set %usagelimit 1 | halt }
      if ($me isin $2) || ($me isin $3) { privmsg $gettok(%Zodbot.data,3,32) 주인님은 그딴 하등 상품과 비교할 대상이 아니다. 썩 꺼지지 못할까!! | set %usagelimit 1 | halt }
      var %statnick $md5($2)
      var %i 0
      while (%i <= $len(%statnick)) {
        inc %i
        if (($mid(%statnick,%i,1) isnum) && ($mid(%statnick,%i,1) != $chr(48))) {
          var %p_mode $mid(%statnick,%i,1)
        }
      }
      var %j 0
      while (%j <= $len(%statnick)) {
        inc %j
        if ($mid(%statnick,%j,1) isnum) {
          var %resultnick $calc(%resultnick + $mid(%statnick,%j,1))
        }
      }
      var %time_div $asctime(HH)
      if (!%time_div) { var %time_div 1 }
      var %price1 $int($calc(%resultnick * %p_mode * 25 * (32 - $asctime(dd)) * (13 - $asctime(hh)) / %time_div))

      var %statnick2 $md5($3)
      var %i 0
      while (%i <= $len(%statnick2)) {
        inc %i
        if (($mid(%statnick2,%i,1) isnum) && ($mid(%statnick2,%i,1) != $chr(48))) {
          var %p_mode $mid(%statnick2,%i,1)
        }
      }
      var %j 0
      while (%j <= $len(%statnick2)) {
        inc %j
        if ($mid(%statnick2,%j,1) isnum) {
          var %resultnick2 $calc(%resultnick2 + $mid(%statnick2,%j,1))
        }
      }
      var %time_div $asctime(HH)
      if (!%time_div) { var %time_div 1 }
      var %price2 $int($calc(%resultnick2 * %p_mode * 25 * (32 - $asctime(dd)) * (13 - $asctime(hh)) / %time_div))
      if (%botnick isin $2) { var %price1 999999999999999999999 }
      if (%botnick isin $3) { var %price2 999999999999999999999 }
      if (%price1 > %price2) {
        var %presult $calc(%price1 / %price2)
        privmsg $gettok(%Zodbot.data,3,32)  $+ $nickdt($2) $+ ( $+ $comgen(%price1) $+ ) $+ 의 가격이 $nickdt($3) $+ ( $+ $comgen(%price2) $+ ) $+ 보다 약 $comgen(%presult) $+ 배 높은 가격에 판매중입니다.
        halt 
      }
      if (%price1 < %price2) {
        var %presult $calc(%price2 / %price1)
        privmsg $gettok(%Zodbot.data,3,32)  $+ $nickdt($3) $+ ( $+ $comgen(%price2) $+ ) $+ 의 가격이 $nickdt($2) $+ ( $+ $comgen(%price1) $+ ) $+ 보다 약 $comgen(%presult) $+ 배 높은 가격에 판매중입니다.
        halt 
      }
      else {
        privmsg $gettok(%Zodbot.data,3,32)  $+ $nickdt($2) $+ ( $+ $comgen(%price1) $+ ) $+ 의 가격은 $nickdt($3) $+ ( $+ $comgen(%price2) $+ ) $+ 와(과) 같은 가격에 판매중입니다.
        halt 
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 팝니다 || $1 == $readini(prefix.ini,%chan,p2) $+ 팝니다 || $1 == $readini(prefix.ini,%chan,p3) $+ 팝니다) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,팝니다,설명) | set %usagelimit 1 | halt }
      if ($len($2) > 255) { privmsg $gettok(%Zodbot.data,3,32) 물건 이름의 길이가 너무 깁니다.  | set %usagelimit 1 | halt }
      if ($me isin $2) { privmsg $gettok(%Zodbot.data,3,32) 주인님은 파는 물건이 아니다. 썩 꺼지지 못할까!! | set %usagelimit 1 | halt }
      var %statnick $md5($2)
      var %i 0
      while (%i <= $len(%statnick)) {
        inc %i
        if (($mid(%statnick,%i,1) isnum) && ($mid(%statnick,%i,1) != $chr(48))) {
          var %p_mode $mid(%statnick,%i,1)
        }
      }
      var %j 0
      while (%j <= $len(%statnick)) {
        inc %j
        if ($mid(%statnick,%j,1) isnum) {
          var %resultnick $calc(%resultnick + $mid(%statnick,%j,1))
        }
      }
      var %time_div $asctime(HH)
      if (!%time_div) { var %time_div 1 }
      var %price $int($calc(%resultnick * %p_mode * 25 * (32 - $asctime(dd)) * (13 - $asctime(hh)) / %time_div))
      if ($rand(1,30) == 7) { var %price $int($calc(%price * $rand(1,50))) | var %p_status 12(특별한정판 가격!!) | var %n_status 1 }
      if ($rand(1,30) == 4) { var %price $int($calc(%price / $rand(1,50))) | var %p_status 4(특별세일가격!!) | var %n_status 1 }
      if (%botnick isin $2) { var %price 999999999999999999999 | var %p_status 12(특별한정판) | var %n_status 1 }
      if ($2 == 홍진호) { var %price 2 | var %p_status 13(2!!) | var %n_status 1 }
      if ($2 == 콩) { var %price 2 | var %p_status 13(2!!) | var %n_status 1 }
      if ($2 == 전두환) { var %price 290000 | var %p_status 13(통장 잔액) | var %n_status 1 }
      if (!%n_status) {
        if (%maxprice < %price) { var %o_price %maxprice | var %o_nick %maxnick | set %maxprice %price | set %maxnick $2 | var %ac_status 1 }
      }
      if (!%n_status) {
        if (%minprice > %price) { var %o_price %minprice | var %o_nick %minnick | set %minprice %price | set %minnick $2 | var %ac_status 2 }
      }
      privmsg $gettok(%Zodbot.data,3,32) < $+ $nickdt(%nick) $+ > 여러분 $nickdt($2) $+ 님을 $comgen(%price) $+ 원에 팔고 있습니다. %p_status
      if (%ac_status == 1) {
        privmsg $gettok(%Zodbot.data,3,32) 4최고가 갱신 : $nickdt(%o_nick) $+ ( $+ $comgen(%o_price) $+ 원) → $nickdt(%maxnick) ( $+ $comgen(%maxprice) $+ 원)
      }
      if (%ac_status == 2) {
        privmsg $gettok(%Zodbot.data,3,32) 4최저가 갱신 : $nickdt(%o_nick) $+ ( $+ $comgen(%o_price) $+ 원) → $nickdt(%minnick) ( $+ $comgen(%minprice) $+ 원)
      }

      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 인코딩 || $1 == $readini(prefix.ini,%chan,p2) $+ 인코딩 || $1 == $readini(prefix.ini,%chan,p3) $+ 인코딩) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,인코딩,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,인코딩,설명) | set %usagelimit 1 | halt }
      if ($2 == url) { var %encodetype $urlencode($3-) | var %active 1 }
      if ($2 == uni) { 
        var %i 0
        while (%i <= $len($3)) {
          inc %i
          if ($dll(hcheck.dll,HangulChk,$mid($3,%i,2)) == ok) {
            var %encodetype %encodetype $+ $chr(38) $+ $chr(35) $+ $readini(ucode.ini,table,$mid($3,%i,2)) $+ $chr(59)
            inc %i
          }
          else { inc %i }
        }
        if (!%encodetype) { var %encodetype 올바르지 않은 형식이거나 잘못된 문자열이 포함되어 있습니다. }
        var %active 1
      }
      if ($2 == huni) { 
        var %i 1
        var %j 0
        var %encodeword $3-
        while (%j <= 128) {
          inc %j
          if (%j == 32) { inc %j }
          var %encodeword $remove(%encodeword,$chr(%j))
        }
        while (%i <= $len(%encodeword)) {
          if ($mid(%encodeword,%i,1) == $chr(32)) {
            var %encodetype %encodetype $+ $chr(37) $+ 20
            inc %i
          }
          if ($asc($mid(%encodeword,%i,1)) isnum 176-200 && $asc($mid(%encodeword,$calc(%i + 1),1)) isnum 161-254) {
            var %encodetype %encodetype $+ $chr(37) $+ u $+ $readini(uhcode.ini,table,$mid(%encodeword,%i,2))
            inc %i
            inc %i
          }
          else { inc %i }
        }
        if (!%encodetype) { var %encodetype 올바르지 않은 형식이거나 잘못된 문자열이 포함되어 있습니다. }
        var %active 1
      }
      if ($2 == utf8) {
        var %encodetype $dll(utf8.dll,convertutf8,$3-)
        var %encodetype $urlencode(%encodetype)
        var %active 1
      }
      if ($2 == md5) { var %encodetype $md5($3-) | var %active 1 }
      if ($2 == u) { var %encodetype $encode( $+ $3- $+ , $+ u $+ ) | var %active 1 }
      if ($2 == m) { var %encodetype $encode( $+ $3- $+ , $+ m $+ ) | var %active 1 }
      if (%active != 1) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,인코딩,설명) | halt }
      privmsg $gettok(%Zodbot.data,3,32) Result : %encodetype
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 디코딩 || $1 == $readini(prefix.ini,%chan,p2) $+ 디코딩 || $1 == $readini(prefix.ini,%chan,p3) $+ 디코딩) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디코딩,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디코딩,설명) | set %usagelimit 1 | halt }
      if ($2 == url) {
        var %decodetype $urldecode($3-)
        if ($asc($mid(%decodetype,1,2)) !isnum 176-200) {
          var %decodetype $dll(utf8.dll,convertlocal,%decodetype)
        }
        var %active 1
      }
      if ($2 == utf8) {
        var %decodetype $urldecode($3-)
        if ($asc($mid(%decodetype,1,2)) !isnum 176-200) {
          var %decodetype $dll(utf8.dll,convertlocal,%decodetype)
        }
        var %active 1
      }
      if ($2 == huni) { 
        var %i 1
        while (%i <= $len($3)) {
          if ($remove($gettok($3,%i,37),u) == 20) { var %decac 1 }
          else {
            if (%decac == 1) { var %decodetype %decodetype $readini(uhcode.ini,table2,$remove($gettok($3,%i,37),u)) | var %decac $null }
            else { var %decodetype %decodetype $+ $readini(uhcode.ini,table2,$remove($gettok($3,%i,37),u)) }
          }
          inc %i
        }
        var %active 1
      }
      if ($2 == uni) {
        var %i 1
        while (%i <= $len($3)) {
          if ($len($gettok($3,%i,59)) == 7 && $chr(38) isin $3 && $chr(35) isin $3) {
            var %decodetype %decodetype $+ $readini(ucode.ini,table2,$remove($gettok($3,%i,59),$chr(59),$chr(38),$chr(35)))
            inc %i
          }
          else { inc %i }
        }
        if (!%decodetype) { var %decodetype 올바르지 않은 형식이거나 잘못된 문자열이 포함되어 있습니다. }
        var %active 1
      }
      if ($2 == u) { var %decodetype $decode( $+ $3- $+ , $+ u $+ ) | var %active 1 }
      if ($2 == m) { var %decodetype $decode( $+ $3- $+ , $+ m $+ ) | var %active 1 }
      if (%active != 1) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디코딩,설명) | set %usagelimit 1 | halt }
      var %k 1
      while (%k <= $len(%decodetype)) {
        var %dcheck $mid(%decodetype,%k,1)
        if ($crlf isin %dcheck || $chr(10) isin %dcheck || $chr(11) isin %dcheck || $chr(12) isin %dcheck || $chr(13) isin %dcheck) { privmsg $gettok(%Zodbot.data,3,32) 올바르지 않은 형식이거나 잘못된 문자열이 포함되어 있습니다. | halt }
        inc %k
      }
      privmsg $gettok(%Zodbot.data,3,32) Result : %decodetype
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 골라 || $1 == $readini(prefix.ini,%chan,p2) $+ 골라 || $1 == $readini(prefix.ini,%chan,p3) $+ 골라) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 골라 항목1 항목2 ... 항목n”와 같은 형식으로 입력하셔야 합니다. (최대 10개) | set %usagelimit 1 | halt }
      if ($2) { if (!$3) { privmsg $gettok(%Zodbot.data,3,32) 한개가지고 뭘 고르라는건지...ㄱ( -_-)r | halt } }
      if ($0 > 11) { privmsg $gettok(%Zodbot.data,3,32) 고를수있는 최대치를 넘어섰습니다. (최대 10개) | halt }
      var %result $rand(2,$0)
      var %randchoice $gettok($1-,%result,32)
      privmsg $gettok(%Zodbot.data,3,32) %randchoice $+ 을(를) 골랐습니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 섞어줘 || $1 == $readini(prefix.ini,%chan,p2) $+ 섞어줘 || $1 == $readini(prefix.ini,%chan,p3) $+ 섞어줘) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,섞어줘,설명) | set %usagelimit 1 | halt }
      if ($len($2) > 100) { privmsg $gettok(%Zodbot.data,3,32) 섞을수 있는 최대치를 넘어섰습니다. (최대 100byte) | set %usagelimit 1 | halt }
      var %result $2
      var %i 1
      while (%i <= $len(%result)) {
        if ($asc($mid(%result,%i,1)) > 127) {
          var %shuffled %shuffled $mid(%result,%i,2)
          inc %i | inc %i
        }
        else { var %shuffled %shuffled $mid(%result,%i,1) | inc %i }
      }
      :msg_result
      var %shuffled $shuffle(%shuffled,32)
      privmsg $gettok(%Zodbot.data,3,32) Result : $remove(%shuffled,$chr(32))
      if (%hwarn) { privmsg $gettok(%Zodbot.data,3,32) %hwarn }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 무협지랄 || $1 == $readini(prefix.ini,%chan,p2) $+ 무협지랄 || $1 == $readini(prefix.ini,%chan,p3) $+ 무협지랄) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 무협지랄 글자수”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      if ($2 !isnum 2-40) { privmsg $gettok(%Zodbot.data,3,32) 숫자가 아니거나, 생성할 범위(2~40자)를 벗어났습니다. | halt }
      var %maxn $2
      var %i 1
      while (%i <= %maxn) {
        inc %i
        var %namer1 $read(무협.txt)
        var %namer2 %namer2 $gettok(%namer1,1,32)
        var %namer3 %namer3 $gettok(%namer1,2,32)
      }
      var %nameresult $remove(%namer2 $+ $chr(40) $+ %namer3 $+ $chr(41),$chr(32))
      privmsg $gettok(%Zodbot.data,3,32) 무협에서 나올법한 이름의 생성물은 " $+ %nameresult $+ " $+ 입니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 이름생성 || $1 == $readini(prefix.ini,%chan,p2) $+ 이름생성 || $1 == $readini(prefix.ini,%chan,p3) $+ 이름생성) {
      var %성씨 $read(성씨.txt)
      :끼힝
      var %names1 $read(한자.txt)
      var %names2 $read(한자.txt)
      if (%names1 == %names2) {
        goto 끼힝
      }
      var %이름 %성씨 $+ %names1 $+ %names2
      privmsg $gettok(%Zodbot.data,3,32) 생성된 이름은 %이름 $+ 입니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 뒈져버려 || $1 == $readini(prefix.ini,%chan,p2) $+ 뒈져버려 || $1 == $readini(prefix.ini,%chan,p3) $+ 뒈져버려) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) 이봐 이봐. 공격할 사람을 지정하지 않았잖아. 당신을 공격하기를 바라나? | set %usagelimit 1 | halt }
      if (($2 !ison %chan) && (%nick != $me)) { privmsg $gettok(%Zodbot.data,3,32) %chan $+ 채널에는 그런사람이 없다네. 상상의 인물은 망상할때나 써먹도록. | halt }
      if ($2 == %nick) { privmsg $gettok(%Zodbot.data,3,32) 자해를 하다니. 미쳤구나? | halt }
      var %attacker $nickdt(%nick)
      var %victim $nickdt($2)
      if (($2 == $me) || ($2 == %botnick) || (%esrever isin $2-)) {
        privmsg $gettok(%Zodbot.data,3,32) 4어디서 개수작이여!!1
        var %attacker $nickdt($me)
        var %victim $nickdt(%nick)
      }
      var %health $rand(1,1000000)
      var %cpercent $rand(1,10)
      if ((%nick == $me) || ($rand(1,10) == 5) || (%cpercent == 4)) {
        if ((%cpercent == 4) && (%nick != $me) && (%victim != $me)) {
          var %attacker $nickdt($2)
          var %victim $nickdt(%nick)
          privmsg $gettok(%Zodbot.data,3,32) 4 $+ $read(형용사.txt) 확률로 $nickdt($2) $+ 님이 $nickdt(%nick) $+ 님께 Critical Hit을 가합니다!!
        }
        var %damage = $rand(1,$calc(2^64))
        var %calc $calc(%health - %damage)
        set %percent $calc((%damage / %health) * 100)
        var %result = $comgen( $+ %health $+ ) -4 $comgen( $+ %damage $+ ) $+ 1 ( $+ $comgen( $+ %percent $+ ) $+ % $+ ) $chr(61) $comgen( $+ %calc $+ ) $+ 
        데미지상태
      }
      else {
        var %damage = $rand(1,$calc(%health * 0.8))
        if (($rand(1,10) == 5) || (%attacker == $nickdt($me))) {
          var %damage = $rand(1,$calc(2^64))
        }
        var %calc = $calc(%health - %damage)
        set %percent $calc((%damage / %health) * 100)
        var %result = $comgen( $+ %health $+ ) -4 $comgen( $+ %damage $+ ) $+ 1 ( $+ $comgen( $+ %percent $+ ) $+ % $+ ) $chr(61) $comgen( $+ %calc $+ ) $+ 
        데미지상태
      }
      var %weapon $read(god.txt)
      if ($3-) { var %weapon $3- }
      데미지상태
      privmsg $gettok(%Zodbot.data,3,32) 1 $+ %attacker $+ 님은 $read(1place.txt) $+ 에서 $read(2situation.txt) $read(3action.txt) 체력 $comgen( $+ %health $+ ) $+ 의 소유자
      privmsg $gettok(%Zodbot.data,3,32) 12 $+ %victim $+ (1별칭 : $read(형용사.txt) $read(nicks.txt) $+ ) 1님에게 %weapon $+ 을(를) $read(5form.txt) $+ 에 가하여 $read(7result.txt) $+  $+ $comgen( $+ %damage $+ ) $+ 의 데미지!!!
      privmsg $gettok(%Zodbot.data,3,32) 1체력이  $+ %result $+ %zeroz $+ 이(가) 된 %victim $+ 님은 %status 되었습니다.
      if (%percent > 100) {
        privmsg $gettok(%Zodbot.data,3,32) 1 %attacker $+ 님은 살해당한 %victim $+ 님께 $read(형용사.txt) 표정으로 말합니다. " $+ $read(comment.txt) $+ "
      }
      halt
    } 
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 미래 || $1 == $readini(prefix.ini,%chan,p2) $+ 미래 || $1 == $readini(prefix.ini,%chan,p3) $+ 미래) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 미래 이름”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      if (($2 == $me) || ($2 == %botnick) || (%esrever isin $2-)) { privmsg $gettok(%Zodbot.data,3,32) 검색이 불가능한 이름입니다. | halt }
      if (%nick != $me) {
        if (%nick != $2-) {
          privmsg $gettok(%Zodbot.data,3,32) 타인의 미래는 볼수 없습니다. $nickdt(%nick) $+ 님의 미래만 조회 할 수 있습니다.
          privmsg $gettok(%Zodbot.data,3,32) 다음과 같은 형식만 유효합니다. usage : $readini(prefix.ini,%chan,p1) $+ 미래 %nick
          halt
        }
      }
      var %randcha $chan($rand(2,$chan(0)))
      var %randper $nick(%randcha,$rand(1,$nick(%randcha,0)))
      var %nameg $htextgen $+ $htextgen $+ $htextgen
      if ((%randper == $me) || (%randper == %botnick)) {
        var %randper $nick(%randcha,$rand(1,$nick(%randcha,0)))
      }
      var %foldu $rand(3000,9999)
      var %male $readini(percent.ini,성별,male), %female $readini(percent.ini,성별,female), %trans $readini(percent.ini,성별,trans)
      var %youhu = $mid($remove($shuffle($str(1,%male) $+ $str(2,%female) $+ $str(3,%trans)) ,$chr(32)),$rand(1,100),1)
      if (%youhu == 1) { var %gender 남자 } | if (%youhu == 2) { var %gender 여자 } | if (%youhu == 3) { var %gender 트랜스젠더 } 
      var %성씨 $read(성씨.txt)
      :잇힝
      var %names1 $read(한자.txt)
      var %names2 $read(한자.txt)
      if (%names1 == %names2) {
        goto 잇힝
      }
      var %getmonth $rand(1,12)
      var %getday $rand(1,30)
      var %이름 %성씨 $+ %names1 $+ %names2
      privmsg $gettok(%Zodbot.data,3,32) $nickdt($2) $+ 님은 %foldu $+ 년 %getmonth $+ 월 %getday $+ 일에 %이름 (이)라는 이름을 사용하는 %gender $+ 로 다시 태어나 $masking(%randcha) $+ 채널에 계신 $nickdt(%randper) $+ 님께
      privmsg $gettok(%Zodbot.data,3,32) $read(과목명.txt) $+ 수업을 받다말고 $read(형용사.txt) $uiif($read(4weapon.txt),$read(skill.txt)) $+ (을)를 사용하여 $read(doing.txt) $+ 하다가 $read(1place.txt) $+ (이)라는 곳에서 $read(attacked.txt) 됩니다.
      if ($ini(소감.ini,미래,0) >= 30) {
        var %randuser $rand(1,$ini(소감.ini,미래,0))
        privmsg $gettok(%Zodbot.data,3,32) 이 상황을 지켜보던 $ini(소감.ini,미래,%randuser) $+ 님은 $calc( %foldu - $asctime(yyyy)) $+ 년 후에 %이름 $+ 님이 겪게 될 상황에 대해서 " $+ $readini(소감.ini,미래,$ini(소감.ini,미래,%randuser)) $+ " (이)라고 기술하셨습니다.
        halt
      }
      if ($ini(소감.ini,미래,0) < 50) {
        privmsg $gettok(%Zodbot.data,3,32) 죄송합니다만, 현재 소감db가 준비되지 않았습니다. "$readini(prefix.ini,%chan,p1) $+ 소감 소감내용" 으로 참여해주세요.
        privmsg $gettok(%Zodbot.data,3,32) 여러분의 기발한 아이디어를 부탁드립니다.
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 소감 || $1 == $readini(prefix.ini,%chan,p2) $+ 소감 || $1 == $readini(prefix.ini,%chan,p3) $+ 소감) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 소감 소감내용”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      writeini -n 소감.ini 미래 %nick $2-
      privmsg $gettok(%Zodbot.data,3,32) " $+ $2- $+ " 이라는 소감을 db에 입력하셨습니다.
      ;          privmsg $gettok(%Zodbot.data,3,32) 앞으로 $calc(50 - $ini(소감.ini,미래,0)) 명의 사람이 더 소감을 남겨야 $readini(prefix.ini,%chan,p1) $+ 미래에서 사용이 가능합니다.
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 현재 || $1 == $readini(prefix.ini,%chan,p2) $+ 현재 || $1 == $readini(prefix.ini,%chan,p3) $+ 현재) {
      privmsg $gettok(%Zodbot.data,3,32) 현재는 알아서 뭐하게? 본인이 더 잘알텐데? 너 찌질이잖아. (づ `∀´)∠))) 푸헹헹헹헹
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 현재곡 || $1 == $readini(prefix.ini,%chan,p2) $+ 현재곡 || $1 == $readini(prefix.ini,%chan,p3) $+ 현재곡) {
      privmsg $gettok(%Zodbot.data,3,32) 현재 재생중인 곡 : $readini(winamp.ini,music,1) (이 파일을 다운받기 원하시면 @주세요 를 입력하세요.)
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 주세요 || $1 == $readini(prefix.ini,%chan,p2) $+ 주세요 || $1 == $readini(prefix.ini,%chan,p3) $+ 주세요) {
      dcc send -c %nick $readini(winamp.ini,music,2)
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 뒷조사 || $1 == $readini(prefix.ini,%chan,p2) $+ 뒷조사 || $1 == $readini(prefix.ini,%chan,p3) $+ 뒷조사) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 뒷조사 이름”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      if (($2 == $me) || ($2 == %botnick) || (%esrever isin $2-) || (%botnick isin $2-)) { privmsg $gettok(%Zodbot.data,3,32) 4어디서 개수작이여!! | halt }
      var %tmp $md5($2)
      var %maxn $rand(2,3)
      var %i 1
      while (%i <= %maxn) {
        inc %i
        var %namer1 $read(무협.txt)
        var %namer2 %namer2 $gettok(%namer1,1,32)
      }
      var %nameresult $remove(%namer2,$chr(32))
      var %aselect $rand(1,2)
      if (%aselect == 1) {
        privmsg $gettok(%Zodbot.data,3,32) 성 : $mid($2,1,2) $+ , 이름 : $mid($2,3)
      }
      if (%aselect == 2) {
        privmsg $gettok(%Zodbot.data,3,32) 성 : $mid($2,1,4) $+ , 이름 : $mid($2,5)
      }
      var %i 1
      while (%i <= 32) {
        if ($mid(%tmp,%i,1) !isnum 0-9) { inc %i }
        var %iq = $calc(%iq + $mid(%tmp,%i,1)) | inc %i
      }
      var %iq $calc(%iq + 32 / 2.5)
      privmsg $gettok(%Zodbot.data,3,32) 나이 : $rand(1,99) $+ , 성별 : $replace($rand(1,3),1,남,2,여,3,$uiif(남,여) $+ 성형 트랜스젠더) $+ , 키 : $rand(50,250) $+ cm, 몸무게 : $rand(30,150) $+ kg
      privmsg $gettok(%Zodbot.data,3,32) IQ : $int(%iq) $+ , 최종학력 : %nameresult $+ $replace($rand(1,6),1,유치원,2,초등학교,3,중학교,4,고등학교,5,대학교,6,대학원)
      privmsg $gettok(%Zodbot.data,3,32) 직업 : $read(jobs.txt)
      privmsg $gettok(%Zodbot.data,3,32) 출신지 : $read(city.txt) $+ , 현재거주지 : $read(city.txt)
      privmsg $gettok(%Zodbot.data,3,32) 평소 자주 쓰는말 : $read(comment.txt)
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 과거 || $1 == $readini(prefix.ini,%chan,p2) $+ 과거 || $1 == $readini(prefix.ini,%chan,p3) $+ 과거) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 과거 이름”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      if (($2 == $me) || ($2 == %botnick) || (%esrever isin $2-)) { privmsg $gettok(%Zodbot.data,3,32) 검색이 불가능한 이름입니다. | halt }
      if (%nick != $me) {
        if (%nick != $2-) {
          privmsg $gettok(%Zodbot.data,3,32) 타인의 과거는 볼수 없습니다. $nickdt(%nick) $+ 님의 과거만 조회 할 수 있습니다.
          privmsg $gettok(%Zodbot.data,3,32) 다음과 같은 형식만 유효합니다. usage : $readini(prefix.ini,%chan,p1) $+ 과거 %nick
          halt
        }
      }
      var %randcha $chan($rand(2,$chan(0)))
      var %randper $nick(%randcha,$rand(1,$nick(%randcha,0)))
      var %nameg $htextgen $+ $htextgen $+ $htextgen
      if ((%randper == $me) || (%randper == %botnick)) {
        var %randper $nick(%randcha,$rand(1,$nick(%randcha,0)))
      }
      var %male $readini(percent.ini,성별,male), %female $readini(percent.ini,성별,female), %trans $readini(percent.ini,성별,trans)
      var %youhu = $mid($remove($shuffle($str(1,%male) $+ $str(2,%female) $+ $str(3,%trans)) ,$chr(32)),$rand(1,100),1)
      if (%youhu == 1) { var %gender 남자 } | if (%youhu == 2) { var %gender 여자 } | if (%youhu == 3) { var %gender 트랜스젠더 } 
      var %bcad $rand(1,2)
      var %aold $rand(1,110)
      var %deadcause $read(deadcause.txt)
      if (%bcad == 1) { var %bc 기원전 | var %agec $rand(1,9999) | var %charold $calc( %agec + $asctime(yyyy)) } | if (%bcad == 2) { var %bc $null | var %agec $rand(1,1900) | var %charold $calc($asctime(yyyy) - %agec ) }
      privmsg $gettok(%Zodbot.data,3,32) $nickdt($2) $+ 님은 %bc %agec $+ 년 $rand(1,12) $+ 월 $rand(1,30) $+ 일에 $engnick (이)라는 $read(형용사.txt) 이름을 사용하는 %gender $+ 로써, $read(city.txt) $+ (이)라는 곳에서
      privmsg $gettok(%Zodbot.data,3,32) $read(jobs.txt) $+ (이)라는 직업으로 먹고 살고 있었는데, 어느날 %deadcause 향년 %aold $+ 세에 인생을 마감하였습니다.
      if ($ini(소감.ini,과거,0) >= 30) {
        var %randuser $rand(1,$ini(소감.ini,미래,0))
        privmsg gettok(%Zodbot.data,3,32) 그리고 오늘, 당신은 이 결과를 %chan $+ 채널에서 %charold $+ 년 만에 이 사실을 알게 되었습니다.
        privmsg $gettok(%Zodbot.data,3,32) 당신이 %charold $+ 년 전에 남긴 유언은 다음과 같습니다. " $+ $readini(소감.ini,과거,$ini(소감.ini,과거,%randuser)) $+ " - $ini(소감.ini,과거,%randuser) 님 작품
        halt
      }
      if ($ini(소감.ini,과거,0) < 50) {
        privmsg $gettok(%Zodbot.data,3,32) 죄송합니다만, 현재 유언db가 준비되지 않았습니다. "$readini(prefix.ini,%chan,p1) $+ 유언 유언내용" 으로 참여해주세요.
        privmsg $gettok(%Zodbot.data,3,32) 여러분의 기발한 아이디어를 부탁드립니다.
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 유언 || $1 == $readini(prefix.ini,%chan,p2) $+ 유언 || $1 == $readini(prefix.ini,%chan,p3) $+ 유언) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 유언 유언내용”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      ;        if ($readini(소감.ini,과거,%nick)) {
      ;          privmsg $gettok(%Zodbot.data,3,32) %nick $+ 님은 이미 유언을 남기셨습니다.
      ;          halt
      ;        }
      writeini -n 소감.ini 과거 %nick $2-
      privmsg $gettok(%Zodbot.data,3,32) " $+ $2- $+ " 이라는 유언을 db에 입력하셨습니다.
      ;          privmsg $gettok(%Zodbot.data,3,32) 앞으로 $calc(50 - $ini(소감.ini,과거,0)) 명의 사람이 더 유언을 남겨야 $readini(prefix.ini,%chan,p1) $+ 과거에서 사용이 가능합니다.
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 반전 || $1 == $readini(prefix.ini,%chan,p2) $+ 반전 || $1 == $readini(prefix.ini,%chan,p3) $+ 반전) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 반전 뒤집을단어”와 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      privmsg $gettok(%Zodbot.data,3,32) Result : $reverse( $+ $2- $+ , $+ $2- $+ )
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 욕콤보 || $1 == $readini(prefix.ini,%chan,p2) $+ 욕콤보 || $1 == $readini(prefix.ini,%chan,p3) $+ 욕콤보) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,욕콤보,설명) | set %usagelimit 1 | halt }
      if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,욕콤보,설명) | set %usagelimit 1 | halt }
      if ($2 > 12) { privmsg $gettok(%Zodbot.data,3,32) 너무 무리하는거 아냐? | halt }
      var %slang_array $urand(1,$lines(slangdb.txt),32,$2)
      var %i 1
      while (%i <= $2) {
        if ($len(%result) > 380) { var %result2 %result2 $read(slangdb.txt,$gettok(%slang_array,%i,32)) }
        if ($len(%result) <= 380) { var %result %result $read(slangdb.txt,$gettok(%slang_array,%i,32)) }
        inc %i
      }
      if ($len(%result) <= 380) { privmsg $gettok(%Zodbot.data,3,32) %result $+ 새꺄! $read(slangcombo.txt) }
      else {
        if (%result2) {
          privmsg $gettok(%Zodbot.data,3,32) %result
          privmsg $gettok(%Zodbot.data,3,32) %result2 $+ 새꺄! $read(slangcombo.txt)
        }
        else { privmsg $gettok(%Zodbot.data,3,32) %result $+ 새꺄! $read(slangcombo.txt) }
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 에라이 || $1 == $readini(prefix.ini,%chan,p2) $+ 에라이 || $1 == $readini(prefix.ini,%chan,p3) $+ 에라이) {
      privmsg $gettok(%Zodbot.data,3,32) $read(slangcombo.txt)
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 뽀뽀 || $1 == $readini(prefix.ini,%chan,p2) $+ 뽀뽀 || $1 == $readini(prefix.ini,%chan,p3) $+ 뽀뽀) {
      var %kiss $rand(1,10) 
      if (%kiss == 10 || $readini(admin.ini,ip,$address(%nick,2)) == 1) {
        ; privmsg $gettok(%Zodbot.data,3,32) 데이트 가서 실컷하세요~ 흥! [14:21:19] <@김하·코> 1 나 토요일날 데이츠있는데
        privmsg $gettok(%Zodbot.data,3,32) 아이 참.. 부끄럽게 그걸 지금 여기서 어떻게 해.. (っ￣ 3￣)つ
        halt
      }
      if ($address(%nick,2) == *!*@이십팬티.users.HanIRC.org) {
        privmsg $gettok(%Zodbot.data,3,32) 저리가 야색마샛퀴야!
        halt      
      }
      else {
        privmsg $gettok(%Zodbot.data,3,32) 저리가 야색마샛퀴야!
      }
      halt      
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 벗어 || $1 == $readini(prefix.ini,%chan,p2) $+ 벗어 || $1 == $readini(prefix.ini,%chan,p3) $+ 벗어) {
      var %sstrip $rand(1,5)
      if (%sstrip == 5 || %nick == $me) {
        privmsg $gettok(%Zodbot.data,3,32) 벗으라면.. 벗겠어요....
        halt
      }      
      if (%sstrip isnum 1-4) {
        privmsg $gettok(%Zodbot.data,3,32) 꺄악!! 뭘 벗겨 이 저질색휘야!!
        halt
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 인원 || $1 == $readini(prefix.ini,%chan,p2) $+ 인원 || $1 == $readini(prefix.ini,%chan,p3) $+ 인원) {
      privmsg $gettok(%Zodbot.data,3,32) 조선로동당 산하 $gettok(%Zodbot.data,3,32) $+ 당의 인원은 총 $nick($gettok(%Zodbot.data,3,32),0) 동무이며, 동무들의 구성은
      if ($nick($gettok(%Zodbot.data,3,32),0) > 30) {
        var %stur 모범적인 당입네다.
      }
      if ($nick($gettok(%Zodbot.data,3,32),0) <= 30) {
        var %stur 별로 성실한 당이 아닙네다.
      }
      privmsg $gettok(%Zodbot.data,3,32) 당간부 : $nick($gettok(%Zodbot.data,3,32),0,o) 동무, 로동당원 : $nick($gettok(%Zodbot.data,3,32),0,v) 동무, 남조선 반동분자 : $nick($gettok(%Zodbot.data,3,32),0,r) 동무가 상주중인 %stur
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 토픽 || $1 == $readini(prefix.ini,%chan,p2) $+ 토픽 || $1 == $readini(prefix.ini,%chan,p3) $+ 토픽) {
      if ($2) {
        if (!$chan(#$2).topic) {
          privmsg $gettok(%Zodbot.data,3,32) #$2 $+ 채널의 토픽을 읽어 올 수 없습니다. 채널명이 올바른지 확인하여 주십시요.
          halt
        }
        privmsg $gettok(%Zodbot.data,3,32) #$2 $+ 채널의 토픽은 " $+ $chan(#$2).topic $+ " 입니다
        halt
      }
      if (!$chan(%chan).topic) {
        privmsg $gettok(%Zodbot.data,3,32) %chan $+ 채널의 토픽을 읽어 올 수 없습니다. 토픽이 존재하지 않습니다.
        halt
      }
      privmsg $gettok(%Zodbot.data,3,32) %chan $+ 채널의 토픽은 " $+ $chan(%chan).topic $+ " 입니다
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 좆같음지수 || $1 == $readini(prefix.ini,%chan,p2) $+ 좆같음지수 || $1 == $readini(prefix.ini,%chan,p3) $+ 좆같음지수) {
      좆같음지수
      if ($2) {
        privmsg $gettok(%Zodbot.data,3,32) $nickdt($2) $+ 의 좆같음지수 : %좆같음 ( $+ %좆같음per $+ $chr(37) $+ , %좆느낌 $+ )
        halt
      }
      privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 의 좆같음지수 : %좆같음 ( $+ %좆같음per $+ $chr(37) $+ , %좆느낌 $+ )
      unset %좆같음
      unset %좆같음per
      unset %좆느낌
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 샘플계산 || $1 == $readini(prefix.ini,%chan,p2) $+ 샘플계산 || $1 == $readini(prefix.ini,%chan,p3) $+ 샘플계산) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,샘플계산,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,샘플계산,설명) | set %usagelimit 1 | halt }
      var %result $calc($2 * 2048 / $3)
      privmsg $gettok(%Zodbot.data,3,32) Max : $2 $+ kb, $3 $+ sec (ADPCM)
      privmsg $gettok(%Zodbot.data,3,32) Sample Rate : $comgen(%result) (Hz)
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 폰번생성 || $1 == $readini(prefix.ini,%chan,p2) $+ 폰번생성 || $1 == $readini(prefix.ini,%chan,p3) $+ 폰번생성) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,폰번생성,설명) | set %usagelimit 1 | halt }
      if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,폰번생성,설명) | set %usagelimit 1 | halt }
      if ($len($2) > 3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,폰번생성,설명) | set %usagelimit 1 | halt }
      var %num1 $rand(2,9) $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9)
      if ($2 == 010) {
        var %num010 $rand(20,99)
        var %num1 %num010 $+ $rand(0,9) $+ $rand(0,9)
        var %prepay %num010 $+ %num1
        if (%num010 == 20) { var %phoneuser (SKT 사용자) }
        if (%num010 == 21) { var %phoneuser (예비국번) }
        if (%num010 isnum 22-24) { var %phoneuser (LGT 2G 019→010 전환사용자) }
        if (%num010 isnum 25-28) { var %phoneuser (KTF 2G 016→010 전환사용자) }
        if (%num010 isnum 29-30) { var %phoneuser (KTF 사용자) }
        if (%num010 == 31) { var %phoneuser (SKT 사용자) }
        if (%num010 isnum 32-34) { var %phoneuser (KTF 2G 016→010 전환사용자) }
        if (%num010 isnum 35-38) { var %phoneuser (SKT 2G 011→010 전환사용자) }
        if (%num010 == 39) { var %phoneuser (LGT 사용자) }
        if (%num010 isnum 40-41) { var %phoneuser (SKT 사용자) }
        if (%num010 isnum 42-44) { var %phoneuser (KTF 2G 018→010 전환사용자) }
        if (%num010 isnum 45-48) { var %phoneuser (SKT 2G 017→010 전환사용자) [단, 4671~4688, 18개는 제외] }
        if (%num010 isnum 49-50) { var %phoneuser (SKT 사용자) }
        if (%num010 == 51) { var %phoneuser (LGT 사용자) }
        if (%num010 isnum 52-54) { var %phoneuser (SKT 2G 011→010 전환사용자) }
        if (%num010 isnum 55-58) { var %phoneuser (LGT 2G 019→010 전환사용자) }
        if (%num010 == 59) { var %phoneuser (예비국번) }
        if (%num010 == 60) { var %phoneuser (예비국번) }
        if (%num010 == 61) { var %phoneuser (예비국번) }
        if (%num010 isnum 62-64) { var %phoneuser (SKT 2G 017→010 전환사용자) }
        if (%num010 isnum 65-68) { var %phoneuser (KTF 2G 018→010 전환사용자) }
        if (%num010 == 69) { var %phoneuser (예비국번) }
        if (%num010 == 70) { var %phoneuser (예비국번) }
        if (%num010 == 71) { var %phoneuser (SKT 2G 011→010 전환사용자) }
        if (%num010 isnum 72-74) { var %phoneuser (KTF 2G 016→010 전환사용자) }
        if (%num010 isnum 75-77) { var %phoneuser (LGT 2G 019→010 전환사용자) }
        if (%num010 == 78) { var %phoneuser (예비국번) }
        if (%num010 isnum 79-84) { var %phoneuser (LGT 2G 019→010 전환사용자) }
        if (%num010 isnum 85-94) { var %phoneuser (SKT 2G 011→010 전환사용자) }
        if (%num010 isnum 95-99) { var %phoneuser (KTF 2G 016→010 전환사용자) }
        if (%prepay == 3040 || %prepay == 4808 || %prepay == 5847 || %prepay == 5848 || %prepay == 6871 || %prepay == 9294) { var %phoneuser (선불폰 국번) }
        if (%prepay isnum 3140-3149) { var %phoneuser (선불폰 국번) }
      }
      if ($2 == 011) { if (%num1 isnum 9670-9673 || %num1 isnum 9680-9699) { var %phoneuser (선불폰 국번) } }
      if ($2 == 016) {
        if (%num1 isnum 9217-9219) { var %phoneuser (선불폰 국번) }
        if (%num1 == 9214-9215) { var %phoneuser (선불폰 국번) }        
      }
      var %num2 $rand(1,9) $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9)
      var %result $2 $+ - $+ %num1 $+ - $+ %num2 %phoneuser
      privmsg $gettok(%Zodbot.data,3,32) 생성된 번호는 " $+ %result $+ "입니다.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 바람계산 || $1 == $readini(prefix.ini,%chan,p2) $+ 바람계산 || $1 == $readini(prefix.ini,%chan,p3) $+ 바람계산) {
      if (!$2) {
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명)
        privmsg $gettok(%Zodbot.data,3,32) 사용하시기전에 http://xeriars.tistory.com/55 를 읽어주십시요.
        privmsg $gettok(%Zodbot.data,3,32) 사용문의 : #Zod or 얼음의도시@유리 | set %usagelimit 1
        halt
      }
      if ($2 == 방어) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명5) | set %usagelimit 1 | halt }
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 방어력수치가 숫자가 아니거나 올바르지 않습니다. 다시한번 확인하여 주십시오.
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명5) | halt }
        if ($3 > 200 || $3 < -200) { privmsg $gettok(%Zodbot.data,3,32) 범위를 초과하였습니다. 계산범위는 -200 ~ +200까지 입니다. | halt }
        if ($4 > $calc(2^32)) { privmsg $gettok(%Zodbot.data,3,32) 데미지 범위를 초과하였습니다. 너무 무리하는거 아냐? | halt }
        var %dcalc $calc(100-(($3 + 200)/20)^2))
        var %dam1 $rand(1000,999999)
        if ($4) { var %dam1 $4 }
        var %damre $int( $calc(%dam1 * (1 - (%dcalc / 100) ) ) )
        privmsg $gettok(%Zodbot.data,3,32) 바람의나라 방어력이 $3 $+ 일때는 %dcalc $+ $chr(37) $+ 의 감소율이 생기며
        if ($3 >= 0) { privmsg $gettok(%Zodbot.data,3,32) 데미지4 $comgen(%dam1) $+ 1을 받았을 때4 $comgen( $+ $calc(%damre - %dam1) $+ ) $+ 1만큼의 데미지가 추가되어 총4 $comgen( $+ %damre $+ ) $+ 1의 데미지를 받습니다. | halt }
        if ($3 < 0) { privmsg $gettok(%Zodbot.data,3,32) 데미지4 $comgen(%dam1) $+ 1을 받았을 때12 $comgen( $+ %damre $+ ) ( $+ $comgen($calc(%damre / 2)) $+ ) $+ 1만큼의 데미지만 받습니다. [괄호안 숫자는 보호 마법 적용시 데미지 입니다.] | halt }
        halt
      }
      if ($2 == 방어역산) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명15) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명15) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명15) | set %usagelimit 1 | halt }
        if (!$6) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명15) | set %usagelimit 1 | halt }
        if ($6 < 0) { privmsg $gettok(%Zodbot.data,3,32) 몹에 적용된 데미지가 음수가 되서는 안됩니다. | set %usagelimit 1 | halt }
        if (!$readini(damage.ini,$3,공식)) { privmsg $gettok(%Zodbot.data,3,32) 해당 기술에 관한 공식이 존재하지 않습니다. | set %usagelimit 1 | halt }
        if ($4 !isnum || $5 !isnum || $6 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 입력하신 수치가 정상적이지 않습니다. | set %usagelimit 1 | halt }
        var %odamage $readini(damage.ini,$3,공식)
        if (($3 == 백호검무) && ($5 < 20000)) { var %odamage $calc($4 + $5) }
        var %acratio $calc((%odamage - $6)*100 / %odamage)
        var %baramac $calc((100 - %acratio)^(1/2) * 20 - 200)
        privmsg $gettok(%Zodbot.data,3,32) 입력된 체력 : $comgen($4) $+  / 입력된 마력 : $comgen($5)  / 입력된 마법 : $3 / 방어 적용 데미지 : $comgen($6)
        privmsg $gettok(%Zodbot.data,3,32) 실제 데미지 : $comgen(%odamage) $+  / 실제 방어력 : %baramac $+  / 데미지 감소율 : %acratio $+ %
        halt
      }
      if ($2 == 천명) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명1) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명1) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($calc($3 + $4 * 2) > 6150000 || $calc($3 + $4 * 2) < 0 ) {
          privmsg $gettok(%Zodbot.data,3,32) 계산할수 있는 입력범위를 초과하셨습니다. 다시 입력하여 주십시오.
          halt
        }
        var %1floor $calc(($3 * 2 + $4 * 3.4) * 4 * 16)
        var %2floor $calc(($3 * 2 + $4 * 3.4) * 8 * 16)
        var %3floor $calc(($3 * 2 + $4 * 3.4) * 12 * 16))
        var %cfloor $calc(($3 * 2 + $4 * 3.4) * 250)
        var %calcsum $calc((%1floor + %2floor + %3floor + %cfloor) / 100000000)
        var %calcsumr $calc(((%1floor * 3) + (%2floor * 3) + (%3floor * 3) + %cfloor) / 100000000)
        privmsg $gettok(%Zodbot.data,3,32) 체력 : $comgen($3) , 마력 : $comgen($4) 일때의 천명시 경험치는 다음과 같습니다.
        privmsg $gettok(%Zodbot.data,3,32) 각 스테이지당 경험치(1 / 2 / 3 / 클리어시) : $comgen(%1floor) / $comgen(%2floor) / $comgen(%3floor) / $comgen(%cfloor)
        privmsg $gettok(%Zodbot.data,3,32) 휴경 200% 적용시(1 / 2 / 3 / 클리어시)  : $comgen($calc(%1floor * 3)) / $comgen($calc(%2floor * 3)) / $comgen($calc(%3floor * 3)) / $comgen(%cfloor)
        privmsg $gettok(%Zodbot.data,3,32) 총 %calcsum $+ 억의 경험치 획득 (휴경 적용시 : %calcsumr $+ 억)
        halt
      }
      if ($2 == 공경) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명2) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명2) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($calc($3 + $4 * 2) > 6150000 || $calc($3 + $4 * 2) < 0 ) {
          privmsg $gettok(%Zodbot.data,3,32) 계산할수 있는 입력범위를 초과하셨습니다. 다시 입력하여 주십시오.
          halt
        }
        var %vtype1 $calc($3 * 2 + $4 * 3.4)
        var %vtype2 $calc(($3 * 2 + $4 * 3.4) * 2)
        var %vtime 60, %vtime2 2.5
        if ($5) { if ($5 isnum) { var %vtime $5 } }
        if ($6) { if ($6 isnum) { var %vtime2 $6 } }
        var %vresult1 $calc((%vtype1 * ((%vtime * 60)  / %vtime2)) / 100000000)
        var %vresult2 $calc((%vtype2 * ((%vtime * 60) / %vtime2)) / 100000000)
        privmsg $gettok(%Zodbot.data,3,32) 체력 : $comgen($3) , 마력 : $comgen($4) 일때의 공성 경험치는 다음과 같습니다. (1발당 %vtime2 $+ 초 기준)
        privmsg $gettok(%Zodbot.data,3,32) 한발당 경험치 (발석차 / 충차) : $comgen(%vtype1) / $comgen(%vtype2)
        privmsg $gettok(%Zodbot.data,3,32)  $+ %vtime $+ 분당 경험치 (발석차 / 충차) : %vresult1 $+ 억 / %vresult2 $+ 억 - 약 $calc((%vtime * 60) / %vtime2) $+ 발 사용.
        halt
      }
      if ($2 == 바돈) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명3) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명3) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명3) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum || $5 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        privmsg $gettok(%Zodbot.data,3,32) 캐시 : $comgen($3) $+ 원, 거래비율 $4 : $5 일때 바돈으로 환산하면 " $+ $comgen($calc(($3 * $4) / $5))) $+ 전" 입니다.
        halt
      }
      if ($2 == 캐시) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명4) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명4) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명4) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum || $5 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        privmsg $gettok(%Zodbot.data,3,32) 바돈 : $comgen($3) $+ 전, 거래비율 $4 : $5 일때 캐시로 환산하면 " $+ $comgen($calc(($3 * $5) / $4))) $+ 원" 입니다.
        halt
      }
      if ($2 == 연대기) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명7) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명7) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명7) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum || $5 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($calc($3 + $4 * 2) > 6150000 || $calc($3 + $4 * 2) < 0 ) {
          privmsg $gettok(%Zodbot.data,3,32) 계산할수 있는 입력범위를 초과하셨습니다. 다시 입력하여 주십시오.
          halt
        }
        if ($5 > 1000000) { privmsg $gettok(%Zodbot.data,3,32) 연대기 경험치가 너무 큰데, 너무 무리하는거 아냐? | halt }
        var %result $calc((($3 * 2) + ($4 * 3.4)) * $5 / 4)
        var %result2 $calc(%result / (2^32 + 1))
        var %point $calc(%result2 - $int(%result2))
        var %result3 $int($calc((2^32 +1) * %point))
        privmsg $gettok(%Zodbot.data,3,32) 체력 : $comgen($3) $+ , 마력 : $comgen($4) $+ , 연대기 경험치 : $comgen($5) $+ 일때의 환산된 실제 경험치는 다음과 같습니다.
        privmsg $gettok(%Zodbot.data,3,32) 환산된 경험치 : $comgen( $+ %result $+ ) ( $+ $int(%result2) $+ 번의 풀경 및 $comgen(%result3) $+ 의 잔여 경험치)
        halt
      }
      if ($2 == 승급) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명6) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명6) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명6) | set %usagelimit 1 | halt }
        if (!$6) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명6) | set %usagelimit 1 | halt }
        if (!$readini(expcalc.ini,$3,체력)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 바람의나라에 존재하는 직업이 아닙니다. | halt }
        var %health $readini(expcalc.ini,$3,체력)
        var %mana $readini(expcalc.ini,$3,마력)
        if ($readini(expcalc.ini,직업,$3) == 1) { 
          if ($4 > 3200000) { privmsg $gettok(%Zodbot.data,3,32) 입력범위를 초과하셨습니다. | halt }
          if ($5 > 550000) { privmsg $gettok(%Zodbot.data,3,32) 입력범위를 초과하셨습니다. | halt }
        }
        if ($readini(expcalc.ini,직업,$3) == 2) { 
          if ($4 > 1300000) { privmsg $gettok(%Zodbot.data,3,32) 입력범위를 초과하셨습니다. | halt }
          if ($5 > 1700000) { privmsg $gettok(%Zodbot.data,3,32) 입력범위를 초과하셨습니다. | halt }
        }
        var %fullhealth $readini(expcalc.ini,$3,풀체)
        var %fullmagic $readini(expcalc.ini,$3,풀마)
        var %health2 $expcalc($4,$3,체력)
        var %mana2 $expcalc($5,$3,마력)
        var %hresult $calc($expcalc(%health,$3,체력) - %health2)
        var %fhresult $calc($expcalc(%fullhealth,$3,체력) - %health2)
        var %mresult $calc($expcalc(%mana,$3,마력) - %mana2)
        var %fmresult $calc($expcalc(%fullmagic,$3,마력) - %mana2)
        if (%hresult < 0) { var %hresult 0 } | if (%fhresult < 0) { var %fhresult 0 }
        if (%mresult < 0) { var %mresult 0 } | if (%fmresult < 0 ) { var %fmresult 0 }
        if ($readini(expcalc.ini,직업,$3) == 1) {
          var %result = $calc(%hresult / 100000000)
          var %fresult = $calc(%fhresult / 100000000)
        }
        if ($readini(expcalc.ini,직업,$3) == 2) {
          var %result = $calc((%hresult + %mresult) / 100000000)
          var %fresult = $calc((%fhresult + %fmresult) / 100000000)
        }
        var %magic $comgen($readini(expcalc.ini,$3,마력))
        var %tmagic $comgen($calc(%mresult / 100000000))
        var %ftmagic $comgen($calc(%fmresult / 100000000))
        var %deathexp $calc(($4 + ($5 * 2) * 50))
        if ($readini(expcalc.ini,직업,$3) == 1) { var %magic 무제한 | var %fullmagic 무제한 | var %tmagic 무제한 | var %ftmagic 무제한 }
        privmsg $gettok(%Zodbot.data,3,32) 목표직업 : $3 $+ , 체력기준 : $comgen($readini(expcalc.ini,$3,체력)) $+ ( $+ $comgen(%fullhealth) $+ ) $+ , 마력기준 : %magic $+ ( $+ $comgen(%fullmagic) $+ ) 12[괄호안의 숫자는 풀승급기준입니다]
        privmsg $gettok(%Zodbot.data,3,32) 목표 체력까지의 경험치 : $comgen($calc(%hresult / 100000000)) $+ ( $+ $comgen($calc(%fhresult / 100000000)) $+ ) $+ 억, 목표 마력까지의 경험치 : %tmagic $+ ( $+ %ftmagic $+ ) $+ 억
        privmsg $gettok(%Zodbot.data,3,32) 총 $comgen(%result) $+ ( $+ $comgen(%fresult) $+ ) $+ 억의 경험치가 필요합니다. (오차범위 : ±1억)
        privmsg $gettok(%Zodbot.data,3,32) 매일 $comgen($6) $+ 억씩 사냥시 $comgen($int($calc(%result / $6) + 1)) $+ ( $+ $comgen($int($calc(%fresult / $6) + 1)) $+ ) $+ 일 후 승급기준에 도달합니다.
        privmsg $gettok(%Zodbot.data,3,32) 현재 체력/마력 기준으로 사냥 중 사망시 잃는 경험치는4 $comgen(%deathexp) 1입니다.
        halt
      }
      if ($2 == 강화) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명8) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명8) | set %usagelimit 1 | halt }
        var %sucp $remove($4,강화)
        var %sucp $replace(%sucp,왕초보,35,초보,40,견습,45,도제,50,숙련,55,전문,60,명장인,70,절대장인,80,대장인,75,장인,65)
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if (%sucp !isnum 35-80) { privmsg $gettok(%Zodbot.data,3,32) 올바른 칭호가 아닙니다. | halt }
        var %point 0
        if ($calc($3 % 2) != 0) { var %point 1 }
        var %result $int($calc((100 - ($3 / 2)) + %point))
        privmsg $gettok(%Zodbot.data,3,32) 강화성공율 :12 %sucp $+ % $+ 1, 내구도감소율(강화실패시) :4 %result $+ % 12- 패널티감소 수치
        halt
      }
      if ($2 == 마법) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명9) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명9) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명9) | set %usagelimit 1 | halt }
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 지력이 정확하게 입력되지 않았습니다. | halt }
        if ($3 > 300) { privmsg $gettok(%Zodbot.data,3,32) 지력을 너무 높게 입력하셨습니다. 계산범위 초과입니다. | halt }
        var %jobs $replace($4,주술사,1,술사,1,현사,1,현인,1,현자,1,도적,2,자객,2,진검,2,귀검,2,태성,2,전사,3,검객,3,검제,3,검황,3,검성,3)
        var %jobs $replace(%jobs,도사,1,도인,1,명인,1,진인,1,진선,1,궁사,4,명궁,4,현궁,4,진탄,4,심안,4)
        if (%jobs !isnum 1-4) { privmsg $gettok(%Zodbot.data,3,32) 바람의나라에 존재하는 직업이 아닙니다. 디질래여? -_-;; | halt }
        if (%jobs == 4) { privmsg $gettok(%Zodbot.data,3,32) 궁사계열의 경우 공격마법을 배울 수 없으므로 계산이 불가능합니다. | halt }
        var %act off
        var %i 1
        while (%i <= $ini(bdamage.ini,0)) { if ($5 == $ini(bdamage.ini,%i)) { var %act on } | inc %i }
        if (%act == on) {
          if (%jobs == 1) {
            if ($3 >= 99) {
              if ($calc($3 % 2) != 0) { var %calc1 $calc($3 + 1) }
              if ($calc($3 % 2) == 0) { var %calc1 $3 }
              var %calc $calc((%calc1 + 98) / 2)
            }
            if ($3 < 99) { var %calc $3 }
          }
          if (%jobs == 2) { var %calc $calc(($3 + 98) / 2) }
          if (%jobs == 3) { var %calc $calc(($3 + 78) / 2) }
          var %result $int($calc((%calc + 100) / 100 * $readini(bdamage.ini,$5,데미지)))
          privmsg $gettok(%Zodbot.data,3,32) 지력 $3 $+ 일 때, $5 $+ 의 데미지는 $comgen(%result) $+ 이며 소모마력은 $comgen($readini(bdamage.ini,$5,소모마력)) $+ 입니다. (몹 방어력 0기준)
          halt
        }
        else { privmsg $gettok(%Zodbot.data,3,32) $josa($5,은는) 마법공격이 아닙니다. 필살 공격(체력을 소비하여 공격하는 기술)과 오인한것이 아닌지 확인하시기 바랍니다. | halt }
      }
      if ($2 == 재생력) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명10) | set %usagelimit 1 | halt }
        if ($4 == $chr(48)) { goto zerocalc }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명10) | set %usagelimit 1 | halt }
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 잘못된 숫자를 입력하셨습니다. | halt }
        if ($4 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 잘못된 숫자를 입력하셨습니다. | halt }
        :zerocalc
        var %zerocalc $4
        if ($3 > 4000000) { privmsg $gettok(%Zodbot.data,3,32) 체력의 지정범위가 초과되었습니다. 다시 입력하여 주십시요. | halt }
        if ($4 > 2500) { privmsg $gettok(%Zodbot.data,3,32) 재생력의 지정범위가 초과되었습니다. 다시 입력하여 주십시요. | halt }
        var %result = $int($calc($3 * ((%zerocalc / 200 + 0.5) * 0.01)))
        var %rtime1 $int($calc($3 / %result))
        if ($calc(%rtime1 - $int(%rtime1)) != 0) { var %rtime1 $calc($int(%rtime1) + 1) }
        var %rtime2 $calc(%rtime1 * 10)
        if ($calc(%rtime2 - $int(%rtime2)) != 0) { var %rtime2 $calc($int(%rtime2) + 1) }
        privmsg $gettok(%Zodbot.data,3,32) 체력이 $comgen($3)  $+ 이고 재생력이 $comgen(%zerocalc) $+ 일 때 10초당12 $comgen(%result) $+ ( $+ $comgen($int($calc(%zerocalc / 200 + 0.5))) $+ $chr(37) $+ ) $+ 1의 체력이 회복됩니다.
        privmsg $gettok(%Zodbot.data,3,32) 체력 $comgen($3) $+ 이(가) 풀체가 되기까지12 %rtime1 $+ 1번의 재생을 하며 소요시간은6 $replace($duration(%rtime2),mins,분,min,분,secs,초,sec,초) $+ 1입니다.
        halt
      }
      if ($2 == 둔귀) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명11) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명11) | set %usagelimit 1 | halt }
        if ($3 !isnum || $4 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($calc($3 + $4 * 2) > 6150000 || $calc($3 + $4 * 2) < 0 ) {
          privmsg $gettok(%Zodbot.data,3,32) 계산할수 있는 입력범위를 초과하셨습니다. 다시 입력하여 주십시오.
          halt
        }
        var %i 1
        var %j 1
        while (%i <= 10) {
          var %gexp $+ %j $calc((($3 * 20) + ($4 + 34)) * %j)
          inc %i | inc %j
        }
        var %gexp10 $calc((($3 * 20) + ($4 + 34)) * 20)
        var %gexp_all $calc((($3 * 20) + ($4 + 34)) * 65)
        privmsg $gettok(%Zodbot.data,3,32) 입력된 체력 : $comgen($3) / 입력된 마력 : $comgen($4) / 총 경험치 :12 $comgen(%gexp_all)
        privmsg $gettok(%Zodbot.data,3,32) 1/2/3/4/5 굴 경험치 : $comgen(%gexp1) / $comgen(%gexp2) / $comgen(%gexp3) / $comgen(%gexp4) / $comgen(%gexp5)
        privmsg $gettok(%Zodbot.data,3,32) 6/7/8/9/진채 경험치 : $comgen(%gexp6) / $comgen(%gexp7) / $comgen(%gexp8) / $comgen(%gexp9) / $comgen(%gexp10) 
        privmsg $gettok(%Zodbot.data,3,32) ※ 위 경험치는 4"임무 성공시 주어지는 경험치"1이며 몬스터 경험치는 따로 계산하셔야 합니다.
        halt
      }
      if ($2 == 내구보호) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명12) | set %usagelimit 1 | halt }
        if (!$readini(duradb.ini,보호율,$3)) { privmsg $gettok(%Zodbot.data,3,32) $3 $+ 의 내구보호율에 관한 정보를 db에서 찾을 수 없습니다. | set %usagelimit 1 | halt }
        var %dura1 $readini(duradb.ini,보호율,$3)
        var %duraresult $calc(1 - (1 - %dura1))
        var %result $3
        if ($4) {
          if (!$readini(duradb.ini,보호율,$4)) { privmsg $gettok(%Zodbot.data,3,32) $4 $+ 의 내구보호율에 관한 정보를 db에서 찾을 수 없습니다. | set %usagelimit 1 | halt }
          var %dura2 $readini(duradb.ini,보호율,$4)
          var %duraresult $calc(1 - (1 - %dura1) * (1 - %dura2) ))
          var %result $3 $+ , $4
        }
        if ($5) {
          if (!$readini(duradb.ini,보호율,$5)) { privmsg $gettok(%Zodbot.data,3,32) $5 $+ 의 내구보호율에 관한 정보를 db에서 찾을 수 없습니다. | set %usagelimit 1 | halt }
          var %dura3 $readini(duradb.ini,보호율,$5)
          var %duraresult $calc(1 - (1 - %dura1) * (1 - %dura2) * (1 - %dura3)))
          var %result $3 $+ , $4 $+ , $5
        }
        privmsg $gettok(%Zodbot.data,3,32)  $+ %result $+ 의 내구보호율은 $calc(%duraresult * 100) $+ % 입니다.
        halt
      }
      if ($2 == 부화시간) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명13) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명13) | set %usagelimit 1 | halt }
        if ($5) { var %cashratio $5 }
        var %pet1 $replace($3,붉은풀뱀,풀빛뱀,청사,홍사,백두산호돌이,호돌이,눈빛털대호,대호,누렁이,백구,눈빛털진돗개,진돗개,보라곰돌이,곰돌이,백곰,흑곰)
        var %pet1 $replace(%pet1,흑부엉,보라부엉,흑관매,갈관매,노랑거북,거북,흑갑바다거북,바다거북)
        var %pet2 $replace($4,붉은풀뱀,풀빛뱀,청사,홍사,백두산호돌이,호돌이,눈빛털대호,대호,누렁이,백구,눈빛털진돗개,진돗개,보라곰돌이,곰돌이,백곰,흑곰)
        var %pet2 $replace(%pet2,흑부엉,보라부엉,흑관매,갈관매,노랑거북,거북,흑갑바다거북,바다거북)
        writeini pet.ini 구분 알 공통
        writeini pet.ini 구분 유체 공통
        if (!$readini(pet.ini,구분,%pet1)) { privmsg $gettok(%Zodbot.data,3,32) $josa(%pet1,은는) 존재하는 환수가 아니거나 DB에서 읽을수 없는 데이터 입니다. | set %usagelimit 1 | halt }
        if (!$readini(pet.ini,구분,%pet2)) { privmsg $gettok(%Zodbot.data,3,32) $josa(%pet2,은는) 존재하는 환수가 아니거나 DB에서 읽을수 없는 데이터 입니다. | set %usagelimit 1 | halt }
        if ($readini(pet.ini,구분,%pet2) != 공통) {
          writeini pet.ini 구분 알 $readini(pet.ini,구분,%pet2)
          writeini pet.ini 구분 유체 $readini(pet.ini,구분,%pet2)
        }
        if ($4 == 알) { privmsg $gettok(%Zodbot.data,3,32) 목표 환수이름이 "알"이 되서는 안됩니다. | set %usagelimit 1 | halt }
        if ($readini(pet.ini,구분,%pet1) != $readini(pet.ini,구분,%pet2)) { privmsg $gettok(%Zodbot.data,3,32) $josa(%pet1,와과) $josa(%pet2,은는) 같은 계열 환수가 아닙니다. | set %usagelimit 1 | halt }
        if ($ini(pet.ini,$readini(pet.ini,구분,%pet1),%pet1) > $ini(pet.ini,$readini(pet.ini,구분,%pet2),%pet2)) { privmsg $gettok(%Zodbot.data,3,32) 퇴화를 시도하다니... 미쳤구나? | set %usagelimit 1 | halt }
        var %i $ini(pet.ini,$readini(pet.ini,구분,%pet1),%pet1)
        var %petname %pet1 $+ (0시간)
        while (%i < $ini(pet.ini,$readini(pet.ini,구분,%pet2),%pet2)) {
          inc %i
          var %pettime $calc(%pettime + $readini(pet.ini,$readini(pet.ini,구분,%pet2),$ini(pet.ini,$readini(pet.ini,구분,%pet2),%i)))
          var %petname %petname → $ini(pet.ini,$readini(pet.ini,구분,%pet2),%i) $+ ( $+ $readini(pet.ini,$readini(pet.ini,구분,%pet2),$ini(pet.ini,$readini(pet.ini,구분,%pet2),%i)) $+ 시간)
        }
        var %petcash $calc(%pettime / 12)
        if ($5) { var %cashcalc ( $+ $5 $+ :1 기준, 바돈 $comgen($calc(900 * %petcash * %cashratio)) $+ 전) }
        privmsg $gettok(%Zodbot.data,3,32) $3 → $4 까지의 총 환수 부화시간 : %pettime $+ 시간 ( $+ $replace($duration($calc(%pettime * 3600)),wks,주,wk,주,days,일,day,일,hrs,시간,hr,시간,mins,분,min,분,secs,초,sec,초) $+ ) / 필요한 "환수진화촉진의불꽃" 개수 : %petcash $+ 개 %cashcalc
        privmsg $gettok(%Zodbot.data,3,32) %petname
        halt
      }
      if ($2 == 데미지) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명14) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명14) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명14) | set %usagelimit 1 | halt }
        if (!$readini(damage.ini,$3,공식)) { privmsg $gettok(%Zodbot.data,3,32) 해당 마법에 관한 공식을 찾을 수 없습니다. | set %usagelimit 1 | halt }
        privmsg $gettok(%Zodbot.data,3,32)  $+ $chr(91) $+ $3 $+ $chr(93) $+ 의 데미지는 다음과 같습니다.
        if ($6) {
          if ($6 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명14) | set %usagelimit 1 | halt }
          var %accalc $6
        }
        if (!$6) { var %accalc $chr(48) }
        var %dcalc $calc(100-((%accalc + 200)/20)^2))
        if ($3 == 이기어검) { var %accalc $calc(%accalc + 20) | var %cskill (이기어검 방어 +20적용) }
        if ($3 == 무형검) { var %accalc $calc(%accalc + 40) | var %cskill (무형검 방어 +40적용) }
        privmsg $gettok(%Zodbot.data,3,32) 입력된 체력 : $comgen($4) $+  / 입력된 마력 : $comgen($5)  / 입력된 방어력 : %accalc %cskill / 데미지 감소율 : %dcalc $+ $chr(37)
        var %odamage $readini(damage.ini,$3,공식)
        if (($3 == 백호검무) && ($5 < 20000)) { var %odamage $calc($4 + $5) }
        if ($6 isnum || %accalc > 0) {
          if ($readini(damage.ini,$3,진백호령) == 1) { var %denhance / 진백호령 적용시 : $comgen($calc($acconv(%accalc,%odamage) * 1.5)) }
          if ($readini(damage.ini,$3,딜레이)) { var %denhance / 쿨타임 : $readini(damage.ini,$3,딜레이) $+ 초 }
          privmsg $gettok(%Zodbot.data,3,32) 실제 데미지 : $comgen($acconv(%accalc,%odamage)) / 파력무참진 적용시 : $comgen($calc($acconv(%accalc,%odamage) * 2)) / 보호 적용시 : $comgen($int($calc($acconv(%accalc,%odamage) / 2))) %denhance
        }
        else {
          if ($readini(damage.ini,$3,진백호령) == 1) { var %denhance / 진백호령 적용시 : $comgen($calc($acconv(%accalc,%odamage) * 1.5)) }
          if ($readini(damage.ini,$3,딜레이)) { var %denhance / 쿨타임 : $readini(damage.ini,$3,딜레이) $+ 초 }
          privmsg $gettok(%Zodbot.data,3,32) 실제 데미지 : $comgen(%odamage) / 파력무참진 적용시 : $comgen($calc(%odamage * 2)) / 보호 적용시 : $comgen($int($calc(%odamage / 2))) %denhance
        }
        halt
      }
      else { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람계산,설명) | set %usagelimit 1 | halt }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 십계명 || $1 == $readini(prefix.ini,%chan,p2) $+ 십계명 || $1 == $readini(prefix.ini,%chan,p3) $+ 십계명) {
      privmsg $gettok(%Zodbot.data,3,32) Zod 십계명
      var %i 0
      while (%i <= $lines(10com.txt)) {
        inc %i
        privmsg $gettok(%Zodbot.data,3,32) $read(10com.txt,%i)
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 클박 || $1 == $readini(prefix.ini,%chan,p2) $+ 클박 || $1 == $readini(prefix.ini,%chan,p3) $+ 클박) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,클박,설명) | set %usagelimit 1 | halt }
      unset %clubbox.*
      set %clubbox.chan $gettok(%Zodbot.data,3,32)
      set %clubbox.word $2-
      set %clubbox.count 1
      set %clubbox.limit 1
      set %clubbox.cnt 1
      set %clubbox.caller %nick
      sockclose clubbox
      sockopen clubbox boxfile.co.kr 80
      timeout 3 %clubbox.chan clubbox
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 유튜브 || $1 == $readini(prefix.ini,%chan,p2) $+ 유튜브 || $1 == $readini(prefix.ini,%chan,p3) $+ 유튜브) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,유튜브,설명) | set %usagelimit 1 | halt }
      unset %youtube.*
      set %youtube.chan $gettok(%Zodbot.data,3,32)
      set %youtube.word $2-
      set %youtube.url $urlencode($dll(utf8.dll,convertutf8,%youtube.word))
      set %youtube.count 1
      set %youtube.nick %nick
      sockclose youtube
      sockopen youtube www.youtube.com 80
      timeout 3 %youtube.chan youtube
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 서든 || $1 == $readini(prefix.ini,%chan,p2) $+ 서든 || $1 == $readini(prefix.ini,%chan,p3) $+ 서든) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,서든,설명) | set %usagelimit 1 | halt }
      unset %sda.*
      set %sda.chan $gettok(%Zodbot.data,3,32)
      set %sda.id $2
      set %sda.count 1
      sockclose sattack
      sockopen sattack suddenattack.netmarble.net 80
      timeout 3 %sda.chan sattack
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 실시간검색 || $1 == $readini(prefix.ini,%chan,p2) $+ 실시간검색 || $1 == $readini(prefix.ini,%chan,p3) $+ 실시간검색) {
      unset %rnaver.*
      set %rnaver.chan $gettok(%Zodbot.data,3,32)
      set %rnaver.count 1
      sockclose rnaver
      sockopen rnaver www.naver.com 80
      timeout 3 %rnaver.chan rnaver
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 빅파이 || $1 == $readini(prefix.ini,%chan,p2) $+ 빅파이 || $1 == $readini(prefix.ini,%chan,p3) $+ 빅파이) {
      if ($readini(bigfile.ini,ip,$address(%nick,2)) != 1) {
        privmsg $gettok(%Zodbot.data,3,32) [4!1] 사용권한이 없습니다. 문의 : $me | set %usagelimit 1 | halt      
      }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,빅파이,설명) | set %usagelimit 1 | halt }
      if ($2 == 리스트) {
        var %i 0
        while (%i <= $ini(bigfile.ini,파일명,0)) {
          inc %i
          if (%i >= 7) {
            var %filelist2 %filelist2 $readini(bigfile.ini,파일명,%i)
          }
          else { var %filelist %filelist $readini(bigfile.ini,파일명,%i) }
        }
        privmsg $gettok(%Zodbot.data,3,32) 현재 제공중인 빅파이는 다음과 같습니다. (괄호안 숫자는 파일번호 입니다.)
        privmsg $gettok(%Zodbot.data,3,32) %filelist
        if (%filelist2) { privmsg $gettok(%Zodbot.data,3,32) %filelist2 }
        halt      
      }      
      var %bfilename $readini(bigfile.ini,파일명,$2)
      var %filecount $readini(bigfile.ini,카운트,$2)
      var %baddress $readini(bigfile.ini,파일주소,$2)      
      if (!%bfilename) { privmsg $gettok(%Zodbot.data,3,32) DB에서 해당 파일 번호의 내용을 찾을 수 없습니다. @빅파이 리스트 로 검색하시기 바랍니다. | set %usagelimit 1 | halt }
      privmsg $gettok(%Zodbot.data,3,32) 최근 제공되는 빅파이를 notice로 출력하였습니다. URL유출 확인 시 해당 사용자는 블랙리스트에 등록됩니다.
      sockwrite -nt $sockname notice %nick : $+ %bfilename (다운로드 유효기간 : $readini(bigfile.ini,기간,$2) $+ ) : %baddress
      inc %filecount
      sockwrite -nt $sockname notice %nick : $+ [현재 %filecount $+ 번 검색되었으며, 100회 이상 검색된 자료는 다운로드가 불가능할 수 있습니다. $+ ]
      writeini bigfile.ini 카운트 $2 %filecount
      write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. (권한 사용자)      
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ ip추적 || $1 == $readini(prefix.ini,%chan,p2) $+ ip추적 || $1 == $readini(prefix.ini,%chan,p3) $+ ip추적) {
      if (%nick != $me) { halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,ip추적,설명) | set %usagelimit 1 | halt }
      unset %ipw.*
      set %ipw.chan $gettok(%Zodbot.data,3,32)
      set %ipw.id $2-
      sockclose ipwhois
      sockopen ipwhois www.ipsearch.co.kr 80
      timeout 3 %ipw.chan ipwhois
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 거민신분증 || $1 == $readini(prefix.ini,%chan,p2) $+ 거민신분증 || $1 == $readini(prefix.ini,%chan,p3) $+ 거민신분증) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }
      else if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }
      else if ($len($2) != 8) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }
      else if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }
      else if ($3 != 남자 && $3 != 여자) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }      
      else if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }
      else if (!$readini(chnid.ini,지역,$4)) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,거민신분증,설명) | var %Zod_error 1 }

      if (%Zod_error == 1) {
        privmsg $gettok(%Zodbot.data,3,32) 설정가능지역 : $readini(cmdlimit.ini,거민신분증,설명1)
        halt
      }

      if ($exists(tmp_chnid.ini)) { remove tmp_chnid.ini }
      writeini tmp_chnid.ini 정보 1 $mid($readini(chnid.ini,지역,$4),1,1)
      writeini tmp_chnid.ini 정보 2 $mid($readini(chnid.ini,지역,$4),2,1)
      writeini tmp_chnid.ini 정보 3 $rand(0,9)
      writeini tmp_chnid.ini 정보 4 $rand(0,9)
      writeini tmp_chnid.ini 정보 5 $rand(0,9)
      writeini tmp_chnid.ini 정보 6 $rand(0,9)

      writeini tmp_chnid.ini 정보 7 $mid($2,1,1)
      writeini tmp_chnid.ini 정보 8 $mid($2,2,1)
      writeini tmp_chnid.ini 정보 9 $mid($2,3,1)
      writeini tmp_chnid.ini 정보 10 $mid($2,4,1)
      writeini tmp_chnid.ini 정보 11 $mid($2,5,1)
      writeini tmp_chnid.ini 정보 12 $mid($2,6,1)
      writeini tmp_chnid.ini 정보 13 $mid($2,7,1)
      writeini tmp_chnid.ini 정보 14 $mid($2,8,1)

      writeini tmp_chnid.ini 정보 15 $rand(0,9)
      writeini tmp_chnid.ini 정보 16 $rand(0,9)
      writeini tmp_chnid.ini 정보 17 $rand(0,9)

      if ($3 == 남자 && $calc($readini(tmp_chnid.ini,정보,17) % 2) == 0) {
        writeini tmp_chnid.ini 정보 17 $calc($readini(tmp_chnid.ini,정보,17) + 1)
      }
      if ($3 == 여자 && $calc($readini(tmp_chnid.ini,정보,17) % 2) != 0) {
        writeini tmp_chnid.ini 정보 17 $calc($readini(tmp_chnid.ini,정보,17) - 1)
      }
      var %i 1
      while (%i <= $ini(tmp_chnid.ini,정보,0)) {
        var %chn_result $calc(%chn_result + $readini(tmp_chnid.ini,정보,%i) * $readini(chnid.ini,연산,%I))
        inc %i
      }
      var %chn_result $calc(%chn_result % 11)

      If (%chn_result = 0) { %checksum = 1 }
      If (%chn_result = 1) { %checksum = 0 }
      If (%chn_result = 2) { %checksum = X }
      If (%chn_result = 3) { %checksum = 9 }
      If (%chn_result = 4) { %checksum = 8 }
      If (%chn_result = 5) { %checksum = 7 }
      If (%chn_result = 6) { %checksum = 6 }
      If (%chn_result = 7) { %checksum = 5 }
      If (%chn_result = 8) { %checksum = 4 }
      If (%chn_result = 9) { %checksum = 3 }
      If (%chn_result = 10) { %checksum = 2 }

      var %j 1
      while (%j <= 17) {
        var %result %result $+ $readini(tmp_chnid.ini,정보,%j)
        inc %j
      }
      var %result %result $+ %checksum

      var %chn_re1 $readini(tmp_chnid.ini,정보,7)
      var %chn_re2 $readini(tmp_chnid.ini,정보,8)
      var %chn_re3 $readini(tmp_chnid.ini,정보,9)      
      var %chn_re4 $readini(tmp_chnid.ini,정보,10)
      var %chn_re5 $readini(tmp_chnid.ini,정보,11)
      var %chn_re6 $readini(tmp_chnid.ini,정보,12)
      var %chn_re7 $readini(tmp_chnid.ini,정보,13)
      var %chn_re8 $readini(tmp_chnid.ini,정보,14)      

      var %chn_re9 $readini(tmp_chnid.ini,정보,15)
      var %chn_re10 $readini(tmp_chnid.ini,정보,16)
      var %chn_re11 $readini(tmp_chnid.ini,정보,17)

      privmsg $gettok(%Zodbot.data,3,32) 성별 : $3 / 출신지 : $4 / 생년월일 : %chn_re1 $+ %chn_re2 $+ %chn_re3 $+ %chn_re4 $+ 년 %chn_re5 $+ %chn_re6 $+ 월 %chn_re7 $+ %chn_re8 $+ 일 생 / 등록순번 : %chn_re9 $+ %chn_re10 $+ %chn_re11 / 거민신분증번호 : %result
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 마스터 || $1 == $readini(prefix.ini,%chan,p2) $+ 마스터 || $1 == $readini(prefix.ini,%chan,p3) $+ 마스터) {
      if (!$readini(tstatus.ini,$address(%nick,2),캐릭터)) { privmsg $gettok(%Zodbot.data,3,32) 조교 데이터를 읽을 수 없습니다. | halt }
      var %s.target $address(%nick,2)
      var %tt.master $nickdt(%nick)
      if (%nick == $me && $2) { var %s.target *!*@ $+ $2 | var %tt.master $2 }
      var %i 1
      var %t.cnt -1
      while (%i <= $ini(tstatus.ini,%s.target,0)) {
        if ($readini(tstatus.ini,%s.target,$ini(tstatus.ini,%s.target,%i)) >= 10000 || ( $readini(teach.ini,maxlv,$remove($ini(tstatus.ini,%s.target,%i),레이무_,소악마_,치르노_)) == 2 && $readini(tstatus.ini,%s.target,$ini(tstatus.ini,%s.target,%i)) >= 2000)) {
          inc %t.cnt
          if (%t.cnt isnum 0-30) { var %t.master %t.master $+ $chr(44) $ini(tstatus.ini,%s.target,%i) }
          else if (%t.cnt isnum 30-60) { var %t.master2 %t.master2 $+ $chr(44) $ini(tstatus.ini,%s.target,%i) }          
        }
        inc %i
      }
      var %master $readini(tmaster.ini,칭호,%t.cnt)
      var %t.master $replace($remove($mid(%t.master,3),$chr(32) $+ 캐릭터 $+ $chr(44)),치르노_,(치),레이무_,(레),소악마_,(소))
      var %t.master $remove(%t.master,캐릭터,$chr(44))
      var %t.master2 $replace($remove($mid(%t.master2,3),$chr(32) $+ 캐릭터 $+ $chr(44)),치르노_,(치),레이무_,(레),소악마_,(소))
      var %t.master2 $remove(%t.master2,캐릭터,$chr(44))
      if (!%t.master) { var %t.master 없음 }
      privmsg $gettok(%Zodbot.data,3,32) %tt.master $+ 님의 현재 칭호는 %master $+ 이며 총 %t.cnt $+ 개의 마스터 입니다.
      privmsg $gettok(%Zodbot.data,3,32) 조교완료 : %t.master
      if (%t.master2) { privmsg $gettok(%Zodbot.data,3,32) %t.master2 }

    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 조교 || $1 == $readini(prefix.ini,%chan,p2) $+ 조교 || $1 == $readini(prefix.ini,%chan,p3) $+ 조교) {
      ; if (%nick != $me) { privmsg $gettok(%Zodbot.data,3,32) 다른 명령어의 버그 수정 작업을 위해 잠시 명령어 실행을 정지합니다. | halt }
      if (!$ini(tstatus.ini,$address(%nick,2))) {
        if (%chan == #마왕부활단) { }
        else {
          privmsg $gettok(%Zodbot.data,3,32) [4!1] 뒤지게 쳐맞기전에 가서 동네 문방구 뽑기하는 초딩들 삥이 뜯고 까까나 사먹어라. 애들은 실행 안해준다. 'ㅅ'ㅗ | set %usagelimit 1 | halt
        }
      }
      if (!$2) {
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,조교,설명)
        privmsg $gettok(%Zodbot.data,3,32) $readini(cmdlimit.ini,조교,설명1)
        halt
      }
      if (!$readini(teach.ini,maxlv,$2)) {
        privmsg $gettok(%Zodbot.data,3,32) 할 수 없는 행동이거나 지원되는 행동이 아닙니다. Usage : $readini(cmdlimit.ini,조교,설명)
        privmsg $gettok(%Zodbot.data,3,32) $readini(cmdlimit.ini,조교,설명1)
        halt
      }
      if ($2 == 캐릭터) {
        if (!$readini(teach.ini,캐릭터,$3)) {
          var %i 1
          while (%i <= $ini(teach.ini,캐릭터,0)) {
            var %s.char %s.char $+ $chr(44) $ini(teach.ini,캐릭터,%i)
            inc %i
          }      
          privmsg $gettok(%Zodbot.data,3,32) 입력하신 캐릭터는 지원되지 않거나 존재하지 않는 캐릭터 입니다. Usage : @조교 캐릭터 캐릭터명 (ex : @조교 캐릭터 $uiif(치르노,소악마,레이무) $+ )
          privmsg $gettok(%Zodbot.data,3,32) 현재 조교 가능한 캐릭터 : $mid(%s.char,3)        
          halt
        }
        writeini -n tstatus.ini $address(%nick,2) 캐릭터 $3      
        privmsg $gettok(%Zodbot.data,3,32) $3 $+ (으)로 조교가 가능하도록 설정되었습니다.
        halt            
      }
      var %character t $+ $readini(tstatus.ini,$address(%nick,2),캐릭터) $+ .ini
      if (!$readini(tstatus.ini,$address(%nick,2),캐릭터)) {
        var %i 1
        while (%i <= $ini(teach.ini,캐릭터,0)) {
          var %s.char %s.char $+ $chr(44) $ini(teach.ini,캐릭터,%i)
          inc %i
        }      
        privmsg $gettok(%Zodbot.data,3,32) 조교할 캐릭터를 선택하여 주시기 바랍니다. Usage : @조교 캐릭터 캐릭터명  (ex : @조교 캐릭터 $uiif(치르노,소악마,레이무) $+ )
        privmsg $gettok(%Zodbot.data,3,32) 현재 조교 가능한 캐릭터 : $mid(%s.char,3)
        halt      
      }            
      if (!$readini(%character,$2 $+ 1,1)) {
        privmsg $gettok(%Zodbot.data,3,32) 현재 캐릭터는 $2 $+ (으)로 조교할 수 없습니다. 다른 행동으로 조교해주세요.
        halt      
      }
      var %r.health $readini(tstatus.ini,$address(%nick,2),캐릭터)) $+ $chr(95) $+ 체력
      if ($readini(tstatus.ini,$address(%nick,2),%r.health) < 20) {
        privmsg $gettok(%Zodbot.data,3,32) $readini(tstatus.ini,$address(%nick,2),캐릭터)) $+ 의 체력이 너무 낮습니다. 잠시 후 다시 조교하시기 바랍니다.
        halt      
      }
      var %t.char $readini(tstatus.ini,$address(%nick,2),캐릭터) $+ $chr(95) $+ $2
      if (!$readini(tstatus.ini,$address(%nick,2),%t.char)) {
        writeini -n tstatus.ini $address(%nick,2) %t.char 1
      }
      if (!$readini(tstatus.ini,$address(%nick,2),%r.health)) {
        writeini -n tstatus.ini $address(%nick,2) %r.health $readini(teach.ini,체력,$readini(tstatus.ini,$address(%nick,2),캐릭터))
      }              
      if ($readini(tstatus.ini,$address(%nick,2),%t.char) <= $readini(teach.ini,exp,1)) {
        var %teach $2 $+ 1
        privmsg $gettok(%Zodbot.data,3,32) $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))
      }
      else if ($readini(tstatus.ini,$address(%nick,2),%t.char) <= $readini(teach.ini,exp,2)) {
        var %teach $2 $+ 2
        if ($readini(teach.ini,maxlv,$2) == 2) {
          privmsg $gettok(%Zodbot.data,3,32) [조교완료] $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))        
        }
        else { privmsg $gettok(%Zodbot.data,3,32) $readini(%character,%teach,$rand(1,$ini(%character,%teach,0))) }
      }
      else if ($readini(tstatus.ini,$address(%nick,2),%t.char) <= $readini(teach.ini,exp,3)) {
        var %teach $2 $+ 3
        if (!$readini(%character,%teach,1)) { var %teach $2 $+ 2 }
        privmsg $gettok(%Zodbot.data,3,32) [조교완료] $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))
      }
      else if ($readini(tstatus.ini,$address(%nick,2),%t.char) > $readini(teach.ini,exp,3)) {
        var %teach $2 $+ 3
        ; echo -a $readini(%character,%teach,1)
        if (!$readini(%character,%teach,1)) { var %teach $2 $+ 2 }
        privmsg $gettok(%Zodbot.data,3,32) [조교완료] $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))
      }
      else {
        var %teach $2 $+ 2
        if (!$readini(%character,%teach,1)) { var %teach $2 $+ 2 }
        if ($readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))) {
          privmsg $gettok(%Zodbot.data,3,32) $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))        
        }
        var %teach $2 $+ 3
        else if ($readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))) {
          privmsg $gettok(%Zodbot.data,3,32) [조교완료] $readini(%character,%teach,$rand(1,$ini(%character,%teach,0)))        
        }
      }
      var %t.exp $rand(1,200)
      var %t.health $rand(30,150)
      var %t.heal $readini(tstatus.ini,$address(%nick,2),캐릭터) $+ $chr(95) $+ 체력
      var %h.gauge $calc($readini(tstatus.ini,$address(%nick,2),%t.heal) - %t.health)
      if (%h.gauge <= 0) { var %h.gauge 1 }
      privmsg $gettok(%Zodbot.data,3,32)  $+ $2 $+ 의 숙련도 : $readini(tstatus.ini,$address(%nick,2),%t.char) → $calc($readini(tstatus.ini,$address(%nick,2),%t.char) + %t.exp) / $readini(tstatus.ini,$address(%nick,2),캐릭터) $+ 의 체력 : $percent2(%h.gauge,$readini(teach.ini,체력,$readini(tstatus.ini,$address(%nick,2),캐릭터)),40)
      writeini -n tstatus.ini $address(%nick,2) %t.char $calc($readini(tstatus.ini,$address(%nick,2),%t.char) + %t.exp)
      writeini -n tstatus.ini $address(%nick,2) %t.heal %h.gauge
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 트위터 || $1 == $readini(prefix.ini,%chan,p2) $+ 트위터 || $1 == $readini(prefix.ini,%chan,p3) $+ 트위터) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,트위터,설명) | set %usagelimit 1 | halt }
      unset %tweet.*      
      set %tweet.id $2
      set %tweet.chan %chan
      set %tweet.count 1
      var %tweet.check $asc($mid($2-,%i,1))
      var %i 1
      while (%i <= $len(%tweet.id)) {
        if (%tweet.check !isnum 97-122 && %tweet.check !isnum 65-90 && %tweet.check !isnum 48-57) { privmsg %tweet.chan [4!1] 입력하신 사용자를 찾을 수 없습니다. | halt }
        inc %i
      }      
      sockclose tweeter
      sockopen tweeter twitter.com 80
      timeout 5 %tweet.chan tweeter
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 카트 || $1 == $readini(prefix.ini,%chan,p2) $+ 카트 || $1 == $readini(prefix.ini,%chan,p3) $+ 카트) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,카트,설명) | set %usagelimit 1 | halt }
      unset %kart.*      
      set %kart.id $2
      set %kart.chan %chan
      set %kart.count 1      
      sockclose kartrider
      sockopen kartrider kart.nexon.com 80
      timeout 3 %kart.chan kartrider
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 가사 || $1 == $readini(prefix.ini,%chan,p2) $+ 가사 || $1 == $readini(prefix.ini,%chan,p3) $+ 가사) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,가사,설명) | set %usagelimit 1 | halt }
      if ($len($2-) >= 100) { privmsg $gettok(%Zodbot.data,3,32) 검색하려는 가사가 좀 긴 것 같은데? 너무 무리하는거 아냐? | set %usagelimit 1 | halt }
      unset %lyric.*
      set %lyric.id $2-
      if ($exists(tmp_lyric.txt)) { remove tmp_lyric.txt }
      ; set %lyric.id2 $urlencode($replace(%lyric.id,$chr(32),$chr(43)))
      var %i 1
      while (%i <= $len($2-)) {
        if ($asc($mid($2-,%i,1)) isnum 48-128) { set %lyric.id2 %lyric.id2 $+ $mid($2-,%i,1) }
        else if ($asc($mid($2-,%i,1)) == 32) { set %lyric.id2 %lyric.id2 $+ $replace($mid($2-,%i,1),$chr(32),$chr(43)) }
        else { set %lyric.id2 %lyric.id2 $+ $urlencode($mid($2-,%i,1)) }
        inc %i
      }
      set %lyric.chan %chan
      set %lyric.nick %nick
      set %lyric.count 1      
      sockclose lyric
      sockopen lyric music.search.naver.com 80
      timeout 3 %lyric.chan lyric
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 디씨 || $1 == $readini(prefix.ini,%chan,p2) $+ 디씨 || $1 == $readini(prefix.ini,%chan,p3) $+ 디씨) {
      if (%nick != $me) { halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디씨,설명) | set %usagelimit 1 | halt }
      unset %dcnew.*      
      set %dcnew.id $2
      set %dcnew.chan %chan
      set %dcnew.count 1      
      sockclose dcnew
      sockopen dcnew gall.dcinside.com 80
      timeout 3 %dcnew.chan dcnew
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 날씨 || $1 == $readini(prefix.ini,%chan,p2) $+ 날씨 || $1 == $readini(prefix.ini,%chan,p3) $+ 날씨) {
      if (!$2) {
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,날씨,설명)
        privmsg $gettok(%Zodbot.data,3,32) $readini(cmdlimit.ini,날씨,설명1) 및 외국 도시 지명 (예 : beijing)
        halt
      }
      unset %weather.*
      set %weather.id $replace($2-,$chr(32),+)
      set %weather.id2 $replace(%weather.id,강릉,gangneung,경주,gyeongju,고양,goyang,광명,gwangmyeong,광주,gwangju,구미,gumi,군산,gunsan,군포,gunpo,김해,gimhae,대구,daegu,대전,daejeon,동해,donghae,목포,mokpo,부산,busan,부천,bucheon,서귀포,seogwipo,서울,seoul,성남,seongnam,송탄,songtan,수원,suwon)
      set %weather.id2 $replace(%weather.id2,시흥,siheung,안산,ansan,안양,anyang,용인,yongin,울릉도,ulleung-do,울산,ulsan,원주,wonju,의정부,uijeongbu,익산,iksan,인천,incheon,일산,ilsan,전주,jeonju,제주,jeju,진주,jinju,철원,cheorwon,청주,cheongju,양평,yangpyeong,화성,hwaseong)
      set %weather.id2 $replace(%weather.id2,춘천,chuncheon,파주,paju,평택,pyeongtaek,포항,pohang,흑산도,heuksan-do,충주,chungju,상주,sangju,창원,changwon,천안,cheonan,여수,yeosu,안동,andong,양산,yangsan,태안,taean,진해,jinhae,오산,osan,순천,suncheon,당진,dangjin,마산,masan,삼척,samchok,거제,kuje)
      set %weather.chan %chan
      set %weather.count 1   
      sockclose weather
      sockopen weather www.google.co.kr 80
      timeout 3 %weather.chan weather
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 야동 || $1 == $readini(prefix.ini,%chan,p2) $+ 야동 || $1 == $readini(prefix.ini,%chan,p3) $+ 야동) {
      if ($readini(redtube.ini,ip,$address(%nick,2)) != 1) {
        privmsg $gettok(%Zodbot.data,3,32) [4!1] 뒤지게 쳐맞기전에 가서 동네 문방구 뽑기하는 초딩들 삥이 뜯고 까까나 사먹어라. 애들은 검색 안해준다. 'ㅅ'ㅗ | set %usagelimit 1 | halt      
      }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,야동,설명) | set %usagelimit 1 | halt }
      privmsg $gettok(%Zodbot.data,3,32) 검색중입니다. 원하시는 취향,고품질,풀버전 야동은 가까운 p2p에서 찾으시는것이 더 좋습니다.
      unset %redtube.*
      set %redtube.chan $gettok(%Zodbot.data,3,32)
      set %redtube.id $2
      set %redtube.caller %nick
      set %redtube.count 1
      sockclose redtube
      sockopen redtube www.redtube.com 80
      timeout 3 %redtube.chan redtube
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 와우 || $1 == $readini(prefix.ini,%chan,p2) $+ 와우 || $1 == $readini(prefix.ini,%chan,p3) $+ 와우) {
      ; if (%nick != $me) { privmsg $gettok(%Zodbot.data,3,32) 출력 오류를 수정하기 위해 잠시 이 기능을 정지합니다. 나중에 사용하여 주십시요. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,와우,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,와우,설명) | set %usagelimit 1 | halt }
      if ($exists(tmp_wow.txt)) { remove tmp_wow.txt }
      if ($exists(tmp_wow2.txt)) { remove tmp_wow2.txt }
      unset %wow.*
      set %wow.chan $gettok(%Zodbot.data,3,32)
      set %wow.caller %nick
      set %wow.id $2
      set %wow.serv $3-
      if ($chr(32) isin %wow.serv) { set %wow.serve $replace(%wow.serve,$chr(32),+) }
      set %wow.count 1
      set %wow.cnt 1
      set %wow.cnt2 1
      set %wow.itmc 1
      set %wow.id2 $urlencode($dll(utf8.dll,convertutf8,%wow.id))
      set %wow.serv2 $urlencode($dll(utf8.dll,convertutf8,%wow.serv))      
      sockclose wow
      sockopen wow kr.wowarmory.com 80
      timeout 7 %wow.chan wow
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 디맥 || $1 == $readini(prefix.ini,%chan,p2) $+ 디맥 || $1 == $readini(prefix.ini,%chan,p3) $+ 디맥) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt }
      if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt }
      unset %djmax.*
      set %djmax.chan $gettok(%Zodbot.data,3,32)
      if ($2 == bs || $2 == ce) { set %djmax.bsce $2 | var %djmax.pass 1 }
      if (!%djmax.pass) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt }
      if ($2 == bs) {
        set %djmax.key $replace($3,4BFX,mode=4,5B,mode=2,6BFX,mode=5,4B,mode=1,6B,mode=3,프리스타일,mode=0)
        set %djmax.dj Black Square
        set %djmax.dj2 $2
        if ($remove(%djmax.key,mode=1,mode=2,mode=3,mode=4,mode=5,mode=0)) {
          privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt
        }
      }
      if ($2 == ce) {
        set %djmax.key $replace($3,2B,mode=1,4BFX,mode=5,5B,mode=3,6B,mode=4,4B,mode=2,프리스타일,mode=0)
        set %djmax.dj Clazziquai Edition
        set %djmax.dj2 $2
        if ($remove(%djmax.key,mode=1,mode=2,mode=3,mode=4,mode=5,mode=0)) {
          privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,디맥,설명) | set %usagelimit 1 | halt
        }
      }
      set %djmax.id $4
      set %djmax.page 1
      sockclose djmax
      sockopen djmax www.platinumcrew.co.kr 80
      timeout 5 %djmax.chan djmax
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 바람검색 || $1 == $readini(prefix.ini,%chan,p2) $+ 바람검색 || $1 == $readini(prefix.ini,%chan,p3) $+ 바람검색) {
      if (!$2) { 
        privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명)
        privmsg $gettok(%Zodbot.data,3,32) 사용하시기전에 http://xeriars.tistory.com/55 를 읽어주십시요.
        privmsg $gettok(%Zodbot.data,3,32) 사용문의 : #Zod or 얼음의도시@유리 | set %usagelimit 1
        halt
      }
      if ($2 == 아이디) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명1) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명1) | set %usagelimit 1 | halt }
        if ($len($3) > 12) { privmsg $gettok(%Zodbot.data,3,32) 허용되는 아이디 글자수는 6글자까지 입니다. (사용문의 : #Zod or 얼음의도시@유리) | halt }
        if (!$istok($servlists,$4,32)) {
          privmsg $gettok(%Zodbot.data,3,32) $4 $+ 서버는 존재하지 않습니다. (사용문의 : #Zod or 얼음의도시@유리)
          halt
        }
        unset %idsearch.*
        set %idsearch.chan $gettok(%Zodbot.data,3,32)
        set %idsearch.id $3
        set %idsearch.server $4
        sockclose idsearch
        sockopen idsearch baram.nexon.com 80
        timeout 3 %idsearch.chan idsearch
        halt
      }
      if ($2 == 랭킹) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명5) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명5) | set %usagelimit 1 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명5) | set %usagelimit 1 | halt }
        if (!$readini(brankdata.ini,서버,$3)) { privmsg $gettok(%Zodbot.data,3,32) $3 $+ 서버는 존재하지 않거나 서비스 되는 서버가 아닙니다. | set %usagelimit 1 | halt }
        if (!$readini(brankdata.ini,직업,$4)) { privmsg $gettok(%Zodbot.data,3,32) $josa($4,은는) 바람의 나라에 존재하는 직업이 아닙니다. | set %usagelimit 1 | halt }
        if ($len($5) > 12) { privmsg $gettok(%Zodbot.data,3,32) 아이디 길이가 너무 깁니다. | set %usagelimit 1 | halt }
        unset %branksearch.*
        set %branksearch.chan $gettok(%Zodbot.data,3,32)
        set %branksearch.server $readini(brankdata.ini,서버,$3)
        set %branksearch.oserver $3
        set %branksearch.job $readini(brankdata.ini,직업,$4)
        set %branksearch.command $1-$5
        if ($4 == 전체) {
          set %branksearch.job $chr(48)
        }
        if ($readini(brankdata.ini,직업,$4) == 6) { set %branksearch.job $replace($readini(brankdata.ini,직업,$4),6,$chr(48)) }
        set %branksearch.ojob $4
        set %branksearch.id $5
        set %branksearch.rank 1
        set %branksearch.orank 1
        if ($6 isnum) {
          if ($6 > 100000) { privmsg $gettok(%Zodbot.data,3,32) 너무 무리하는거 아냐? 10만명 넘는 서버는 없다구.. | set %usagelimit 1 | halt }
          set %branksearch.rank $6 | set %branksearch.orank $6
        }
        set %branksearch.scount 1
        sockclose branksearch
        sockopen branksearch baram.nexon.com 80
        timeout 15 %branksearch.chan branksearch
        privmsg $gettok(%Zodbot.data,3,32)  $+ %branksearch.rank $+ 위 부터 검색중입니다. 잠시 기다려 주십시요. 통신사정에 따라 15초까지 걸릴 수 있습니다.
        if (!$6) { privmsg $gettok(%Zodbot.data,3,32) " $+ $1- 순위(숫자) $+ " $+ 를 입력하면 입력하신 순위부터 +300위까지 빠르게 검색하실 수 있습니다. }
        antiflooder
        halt
      }
      if ($2 == 몬스터) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명10) | set %usagelimit 1 | halt }
        if ($len($3) > 48) { privmsg $gettok(%Zodbot.data,3,32) 허용되는 몬스터 이름자수는 24글자까지 입니다. | halt }
        unset %mon.*
        set %mon.chan $gettok(%Zodbot.data,3,32)
        set %mon.name $3
        set %mon.en off
        set %mon.count 1
        sockclose monsearch
        sockopen monsearch baram.sosiz.com 80
        timeout 3 %mon.chan monsearch
        halt
      }
      if ($2 == 캐시템) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명3) | set %usagelimit 1 | halt }
        if (!$readini(cashitm.ini,$3-,설명)) {
          var %searchword $mid($3-,1,4)
          var %i 0
          var %j 0
          while (%i <= $ini(cashitm.ini,0)) {
            inc %i
            if (%searchword isin $ini(cashitm.ini,%i)) {
              if (%j < 10) { var %result %result $+ $chr(44) $+ $chr(32) $ini(cashitm.ini,%i) }
              if (%j >= 10) { var %i $calc($ini(cashitm.ini,0) + 1) | var %result %result $+ .....(검색결과가 10개 이상입니다.) }
              inc %j
            }
          }
          privmsg $gettok(%Zodbot.data,3,32) $josa($3-,은는) 존재하는 캐시아이템이 아니거나 DB에서 찾을 수 없는 아이템입니다.
          if (%result) {
            privmsg $gettok(%Zodbot.data,3,32) $josa($3-,과와) 비슷한 캐시아이템은 다음과 같습니다.
            privmsg $gettok(%Zodbot.data,3,32)  $+ $mid(%result,4)
          }
          halt
        }
        privmsg $gettok(%Zodbot.data,3,32) 가격 : $readini(cashitm.ini,$3-,가격) / 착용조건 : $readini(cashitm.ini,$3-,착용조건)
        if ($readini(cashitm.ini,$3-,설명) && $readini(cashitm.ini,$3-,설명) != 없음) { privmsg $gettok(%Zodbot.data,3,32) 설명 : $readini(cashitm.ini,$3-,설명) }
        if ($readini(cashitm.ini,$3-,설명3) && $readini(cashitm.ini,$3-,설명2) != 없음) { privmsg $gettok(%Zodbot.data,3,32) $readini(cashitm.ini,$3-,설명2) }
        if ($readini(cashitm.ini,$3-,설명2) && $readini(cashitm.ini,$3-,설명3) != 없음) { privmsg $gettok(%Zodbot.data,3,32) $readini(cashitm.ini,$3-,설명3) }
        halt
      }
      if ($2 == 생산템) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명4) | set %usagelimit 1 | halt }
        if (!$readini(manufacture.ini,$3,구분)) {
          var %searchword $mid($3,1,4)
          var %i 0
          var %j 0
          while (%i <= $ini(manufacture.ini,0)) {
            inc %i
            if (%searchword isin $ini(manufacture.ini,%i)) {
              if (%j < 10) { var %result %result $+ $chr(44) $+ $chr(32) $ini(manufacture.ini,%i) }
              if (%j >= 10) { var %i $calc($ini(manufacture.ini,0) + 1) | var %result %result $+ .....(검색결과가 10개 이상입니다.) }
              inc %j
            }
          }
          privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 존재하는 생산템이 아니거나 DB에서 찾을 수 없는 품목입니다.
          if (%result) {
            privmsg $gettok(%Zodbot.data,3,32) $josa($3-,과와) 비슷한 생산아이템은 다음과 같습니다.
            privmsg $gettok(%Zodbot.data,3,32)  $+ $mid(%result,4)
          }
          halt
        }
        privmsg $gettok(%Zodbot.data,3,32) 품명 : $3 / 구분 : $readini(manufacture.ini,$3,구분) $+ $chr(91) $+ $readini(manufacture.ini,$3,직업) $+ $chr(93) / 성공시 숙련도 상승치 : $comgen($readini(manufacture.ini,$3,숙련도))
        privmsg $gettok(%Zodbot.data,3,32) 필요재료 : $readini(manufacture.ini,$3,재료)
        halt
      }
      if ($2 == 승급기준) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명6) | set %usagelimit 1 | halt }
        if (!$readini(expcalc.ini,$3,체력)) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명5) | set %usagelimit 1 | halt }
        if ($readini(expcalc.ini,직업,$3) == 1) {
          privmsg $gettok(%Zodbot.data,3,32)  $+ $3 $+ (으)로의 칼승급기준(체력/마력) : $comgen($readini(expcalc.ini,$3,체력)) $+ /무제한
          privmsg $gettok(%Zodbot.data,3,32)  $+ $3 $+ (으)로의 풀승급기준(체력/마력) : $comgen($readini(expcalc.ini,$3,풀체)) $+ /무제한
          halt
        }
        else {
          privmsg $gettok(%Zodbot.data,3,32)  $+ $3 $+ (으)로의 칼승급기준(체력/마력) : $comgen($readini(expcalc.ini,$3,체력)) $+ / $+ $comgen($readini(expcalc.ini,$3,마력))
          privmsg $gettok(%Zodbot.data,3,32)  $+ $3 $+ (으)로의 풀승급기준(체력/마력) : $comgen($readini(expcalc.ini,$3,풀체)) $+ / $+ $comgen($readini(expcalc.ini,$3,풀마))
          halt
        }
      }
      if ($2 == 연대기시간) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명7) | set %usagelimit 1 | halt }
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명7) | set %usagelimit 1 | halt }
        if (!$readini(chronicle.ini,$3,1)) { privmsg $gettok(%Zodbot.data,3,32) 연대기 $3 $+ 편의 정보를 찾을 수 없습니다. | set %usagelimit 1 | halt }
        var %i 0
        while (%i <= $ini(chronicle.ini,$3,0)) {
          inc %i
          privmsg $gettok(%Zodbot.data,3,32) $readini(chronicle.ini,$3,%i)
        }
        privmsg $gettok(%Zodbot.data,3,32) 소요시간 : 약 $readini(chronicle.ini,$3,소요시간) $+ 분 ( $+ 총 씬 소요시간 : $durakor($readini(chronicle.ini,$3,씬타임)) $+ , 실제 플레이 시간 : 약 $durakor($calc(($readini(chronicle.ini,$3,소요시간) * 60) - $readini(chronicle.ini,$3,씬타임))) $+ ) / 획득경험치 : 약 $comgen($readini(chronicle.ini,$3,경험치))
        halt
      }
      if ($2 == 조합템) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명8) | set %usagelimit 1 | halt }
        if (!$readini(mixitm.ini,아이템,$3)) {
          privmsg $gettok(%Zodbot.data,3,32) " $+ $3 $+ "의 조합법은 아직 추가 되지 않았습니다.
          privmsg $gettok(%Zodbot.data,3,32) 만약 알고 계신다면  $+ $readini(prefix.ini,%chan,p1) $+ 메모 $3 조합법 : 재료 의 형태로 메모를 남겨주시면 데이터에 추가하겠습니다.
          set %usagelimit 1 | halt
        }
        privmsg $gettok(%Zodbot.data,3,32)  $+ $3 : $readini(mixitm.ini,아이템,$3)
        halt
      }
      if ($2 == 마법재료) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명9) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명9) | set %usagelimit 1 | halt }
        if (!$readini(magic.ini,$3,$4)) { privmsg $gettok(%Zodbot.data,3,32) $3 $+ 의 $josa($4,을를) 찾을 수 없습니다.  | set %usagelimit 1 | halt }
        privmsg $gettok(%Zodbot.data,3,32) 입력된 직업 : $3 / 입력된 마법 : $4
        privmsg $gettok(%Zodbot.data,3,32) $readini(magic.ini,$3,$4)
        halt
      }
      if ($2 == 도감) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명11) | set %usagelimit 1 | halt }
        if (!$readini(illust.ini,$3,번호)) {
          var %searchword $mid($3,1,4)
          var %i 0
          var %j 0
          while (%i <= $ini(illust.ini,0)) {
            inc %i
            if (%searchword isin $ini(illust.ini,%i)) {
              if (%j < 10) { var %result %result $+ $chr(44) $+ $chr(32) $ini(illust.ini,%i) }
              if (%j >= 10) { var %i $calc($ini(illust.ini,0) + 1) | var %result %result $+ .....(검색결과가 10개 이상입니다.) }
              inc %j
            }
          }
          privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 7종류의 도감(초급,고급,십이지신,용궁,일본,중국,환상의섬)에 존재하는 몬스터가 아닙니다.
          if (%result) {
            privmsg $gettok(%Zodbot.data,3,32) $josa($3-,과와) 비슷한 몬스터명은 다음과 같습니다.
            privmsg $gettok(%Zodbot.data,3,32)  $+ $mid(%result,4)
          }
          halt
        }
        privmsg $gettok(%Zodbot.data,3,32) 번호 : $readini(illust.ini,$3,번호) / 도감구분 : $readini(illust.ini,$3,구분) / 서식지 : $readini(illust.ini,$3,서식지) / 보상 : $readini(illust.ini,$3,보상)
        privmsg $gettok(%Zodbot.data,3,32) 경험치 : $comgen($readini(illust.ini,$3,경험치)) / 설명 : $readini(illust.ini,$3,설명)
        halt
      }
      else { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,바람검색,설명) | set %usagelimit 1 | halt }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 최근전적 || $1 == $readini(prefix.ini,%chan,p2) $+ 최근전적 || $1 == $readini(prefix.ini,%chan,p3) $+ 최근전적) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,최근전적,설명) | set %usagelimit 1 | halt }
      if ($len($2) > 10) { privmsg $gettok(%Zodbot.data,3,32) 검색할수 있는 이름은 5자까지 입니다. | halt }
      unset %sleague.*
      set %sleague.chan $gettok(%Zodbot.data,3,32)
      set %sleague.id $2
      set %sleague.id2 $3
      set %sleague.id3 vs %sleague.id2
      set %sleague.count 1
      set %sleague.ocount 1
      set %sleague.icount 1
      set %sleague.cnt 1
      sockclose sleague
      sockopen sleague www.fomos.kr 80
      timeout 3 %sleague.chan sleague
      halt
    }

    if ($1 == $readini(prefix.ini,%chan,p1) $+ 엉터리단어 || $1 == $readini(prefix.ini,%chan,p2) $+ 엉터리단어 || $1 == $readini(prefix.ini,%chan,p3) $+ 엉터리단어) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,엉터리단어,설명) | set %usagelimit 1 | halt }
      if ($2 == $decode(c2V4,m)) { privmsg $gettok(%Zodbot.data,3,32) 저질새끼..-_- }
      unset %jscript.*
      set %jscript.chan $gettok(%Zodbot.data,3,32)
      set %jscript.word $2
      set %jscript.error1 Your acronym must be composed only of letters. Call it a Y2K bug.
      set %jscript.error2 Your acronym must have between 2 and 6 letters. Sorry about that, but TANSTAAFL.
      sockclose junktoy
      sockopen junktoy brunching.com 80
      timeout 3 %jscript.chan junktoy
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 진수변환 || $1 == $readini(prefix.ini,%chan,p2) $+ 진수변환 || $1 == $readini(prefix.ini,%chan,p3) $+ 진수변환) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,진수변환,설명) | set %usagelimit 1 | halt }
      if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. 숫자로만 입력하십시오. | halt }
      privmsg $gettok(%Zodbot.data,3,32) 2진수 : $dec2bqox($2,bin) / 4진수 : $dec2bqox($2,qua) / 8진수 : $dec2bqox($2,oct) / 16진수 : $dec2bqox($2,hex)
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 계산 || $1 == $readini(prefix.ini,%chan,p1) $+ calc || $1 == $readini(prefix.ini,%chan,p2) $+ 계산 || $1 == $readini(prefix.ini,%chan,p3) $+ 계산) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,계산,설명) | set %usagelimit 1 | halt }
      var %calc $remove($2-,$chr(32))
      if ($chr(44) isin %calc) { var %calc $remove(%calc,$chr(44)) }
      privmsg $gettok(%Zodbot.data,3,32) 1(||￣ㄷ￣)/~ 헉!!! 어렵다.. 답은 $comgen( $+ $calc(%calc) $+ ) 인것 같은데요...
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 아스키 || $1 == $readini(prefix.ini,%chan,p2) $+ 아스키 || $1 == $readini(prefix.ini,%chan,p3) $+ 아스키) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,아스키,설명) | set %usagelimit 1 | halt }
      var %ascresult $chr(36) $+ chr $+ ( $+ $asc( $+ $2 $+ ) $+ )
      if ($asc($mid($2,1,2)) isnum 176-200) {
        var %ascresult $chr(36) $+ chr $+ ( $+ $asc($mid($2,1,1)) $+ ) $chr(36) $+ $chr(43) $chr(36) $+ chr $+ ( $+ $asc($mid($2,2,1)) $+ )
      }
      if ($asc($mid($2,2,2)) isnum 176-200) {
        var %ascresult $chr(36) $+ chr $+ ( $+ $asc($mid($2,1,1)) $+ ) $chr(36) $+ $chr(43) $chr(36) $+ chr $+ ( $+ $asc($mid($2,2,1)) $+ )
      }
      privmsg $gettok(%Zodbot.data,3,32) Result : %ascresult
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 현재시간 || $1 == $readini(prefix.ini,%chan,p2) $+ 현재시간 || $1 == $readini(prefix.ini,%chan,p1) $+ 시간 || $1 == $readini(prefix.ini,%chan,p2) $+ 시간 || $1 == $readini(prefix.ini,%chan,p3) $+ 시간 || $1 == $readini(prefix.ini,%chan,p3) $+ 현재시간) {
      if ($2) { set %radix $2 | rtimenow | halt }
      else { timenow | halt }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 달력 || $1 == $readini(prefix.ini,%chan,p2) $+ 달력 || $1 == $readini(prefix.ini,%chan,p3) $+ 달력) {
      var %year $asctime(yyyy)
      if ($2) {
        if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($2 > 9999) { privmsg $gettok(%Zodbot.data,3,32) 숫자 이상하게 입력하면 뒤진다? -_-^ | halt }
        if ($2 <= 0) { privmsg $gettok(%Zodbot.data,3,32) 숫자 이상하게 입력하면 뒤진다? -_-^ | halt }
      var %year $2 | if ($len(%year) != 4) { var %year 20 $+ %year } }
      var %month $remove($asctime(mm),$chr(48))
      if ($asctime(mm) == 10) { var %month 10 }
      if ($3) {
        if ($3 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 올바른 숫자가 아닙니다. | halt }
        if ($3 > 9999) { privmsg $gettok(%Zodbot.data,3,32) 숫자 이상하게 입력하면 뒤진다? -_-^ | halt }
        if ($3 <= 0) { privmsg $gettok(%Zodbot.data,3,32) 숫자 이상하게 입력하면 뒤진다? -_-^ | halt }
        if ($3 == 10) { var %month 10 }
        if ($3 != 10) { var %month $remove($3,$chr(48)) }
      }
      calen %year %month
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 쿠폰강화 || $1 == $readini(prefix.ini,%chan,p2) $+ 쿠폰강화 || $1 == $readini(prefix.ini,%chan,p3) $+ 쿠폰강화) {
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 계정정보가 없습니다. 먼저 @로또 를 실행해주세요. | halt }
      if (!$readini(login.ini,login,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 로그인 정보가 없습니다. /notice Zod @등록 설정할비밀번호 와 같이 설정하여 주십시요. | halt }
      if ($readini(login.ini,status,%nick) != ok) { privmsg $gettok(%Zodbot.data,3,32) 해당 계정은 로그인 된 상태가 아닙니다. 로그인(/notice Zod @로그인 비밀번호) 후 이용해 주십시요. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰강화,설명) | set %usagelimit 1 | halt }
      if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰강화,설명) | set %usagelimit 1 | halt }
      if (!$readini(tmp_exp.ini,쿠폰,$2)) { privmsg $gettok(%Zodbot.data,3,32) 쿠폰번호 형식이 잘못되었거나 정상적으로 발급된 쿠폰이 아닙니다. | set %usagelimit 1 | halt }
      if ($readini(tmp_exp.ini,쿠폰,$2) == x) { privmsg $gettok(%Zodbot.data,3,32) 입력하신 쿠폰번호는 강화용 쿠폰이 아니라 부르마블 쿠폰 이므로 강화할 수 없습니다. | set %usagelimit 1 | halt }
      if ($readini(tmp_exp.ini,쿠폰,$2) != z) { privmsg $gettok(%Zodbot.data,3,32) 입력하신 쿠폰번호는 강화용 쿠폰이 아니라 $iif($readini(tmp_exp.ini,쿠폰,$2) isnum 1-9,저가형,고가형) 쿠폰 이므로 강화할 수 없습니다. | set %usagelimit 1 | halt }
      if ($readini(tmp_exp.ini,돈,%nick) <= 300000 && $4 >= 50) { privmsg $gettok(%Zodbot.data,3,32) 30만원 이하의 소유자는 50% 이상 베팅하실 수 없습니다. | set %usagelimit 1 | halt }
      if ($readini(tmp_exp.ini,쿠폰번호,$2) != %nick) { 
        privmsg $gettok(%Zodbot.data,3,32) 너님 쓰라고 발급된 쿠폰이 아닐텐데? s( ─━┘Д└━─)z
        halt
      }
      if ($3 == 강화) {
        if (!$readini(tmp_exp.ini,강화,$2)) {
          var %ltarget $int($calc($readini(tmp_exp.ini,돈,%nick) / 10))
          var %lbetting 10
          if ($4 isnum) {
            if ($4 < 10) {
              privmsg $gettok(%Zodbot.data,3,32) 10% 이하의 베팅은 불가능합니다.
              halt          
            }
            if ($4 > 90) {
              privmsg $gettok(%Zodbot.data,3,32) 90% 이상의 베팅은 불가능합니다.
              halt          
            }
            var %ltarget $int($calc($readini(tmp_exp.ini,돈,%nick) * ($4 / 100)))          
            var %lbetting $4
          }
          if (!%ltarget) { var %ltarget 1 }          
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) - %ltarget)
          writeini -n tmp_exp.ini 강화 $2 %ltarget
          writeini -n tmp_exp.ini 강화횟수 $2 1
          privmsg $gettok(%Zodbot.data,3,32) 현재 소지금의 %lbetting $+ $chr(37) $+ 인 $comgen(%ltarget) $+ 원을 배팅금액으로 설정하였습니다.
        }
        if ($readini(tmp_exp.ini,강화,$2)) {
          var %lenhance $readini(tmp_exp.ini,강화,$2)
          var %lenhance_num $readini(tmp_exp.ini,강화횟수,$2)
          if (%lenhance_num >= 15) { privmsg $gettok(%Zodbot.data,3,32) 더 이상의 강화는 불가능합니다. 이제 그만 포기하시죠. | halt }
          if (%lenhance_num == 1) { var %lsucc $rand(1,1) | var %lmul 1.2 }
          if (%lenhance_num == 2) { var %lsucc $rand(1,2) | var %lmul 1.5 }
          if (%lenhance_num == 3) { var %lsucc $rand(1,3) | var %lmul 2 }
          if (%lenhance_num == 4) { var %lsucc $rand(1,4) | var %lmul 3 }
          if (%lenhance_num == 5) { var %lsucc $rand(1,5) | var %lmul 4 }
          if (%lenhance_num == 6) { var %lsucc $rand(1,6) | var %lmul 5 }
          if (%lenhance_num == 7) { var %lsucc $rand(1,10) | var %lmul 10 }
          if (%lenhance_num == 8) { var %lsucc $rand(1,20) | var %lmul 20 }
          if (%lenhance_num == 9) { var %lsucc $rand(1,50) | var %lmul 50 }
          if (%lenhance_num == 10) { var %lsucc $rand(1,100) | var %lmul 100 }
          if (%lenhance_num == 11) { var %lsucc $rand(1,1000) | var %lmul 500 }
          if (%lenhance_num == 12) { var %lsucc $rand(1,2000) | var %lmul $rand(500,1000) }
          if (%lenhance_num == 13) { var %lsucc $rand(1,5000) | var %lmul $rand(1000,5000) }
          if (%lenhance_num == 14) { var %lsucc $rand(1,10000) | var %lmul $rand(5000,10000) }
          if (%lblessing && %nick == %lblessing_for) {
            var %lsucc 1
            set %lblessing $calc(%lblessing - 1)
          }
          ; if (%nick == 에드워드) { var %lsucc 1 }
          if (%lsucc == 1) {
            privmsg $gettok(%Zodbot.data,3,32) 쿠폰 강화에 성공하였습니다! (+ $+ %lenhance_num → + $+ $calc(%lenhance_num + 1) / 배당금 : $comgen(%lenhance) → $comgen($int($calc(%lenhance * %lmul))) $+ )
            writeini -n tmp_exp.ini 강화 $2 $int($calc(%lenhance * %lmul))            
            writeini -n tmp_exp.ini 강화횟수 $2 $calc(%lenhance_num + 1)
            if ($calc(%lenhance_num + 1) == 4) { privmsg $gettok(%Zodbot.data,3,32) ※ +4 부터는 포기가 가능합니다만 배당금의 50%만 받습니다. 쫄리면 포기하시든지 ㅋㅋ }
            if ($calc(%lenhance_num + 1) == 7) { privmsg $gettok(%Zodbot.data,3,32) ※ +7 부터는 포기하셔도 배당금의 50% 감소가 없습니다. }
            halt
          }
          else {
            if (%lenhance_num < 7) {
              privmsg $gettok(%Zodbot.data,3,32) 쿠폰 강화에 실패하였습니다! √(´∀`√) 4(배당금 폭파!)
              writeini -n tmp_exp.ini 폭파 돈 $calc($readini(tmp_exp.ini,폭파,돈) + $readini(tmp_exp.ini,강화,$2) / 100000000)
              privmsg $gettok(%Zodbot.data,3,32) 통계 집계 후 현재까지 폭파된 금액의 합계는 $comgen($readini(tmp_exp.ini,폭파,돈)) $+ 억 원입니다.
              remini -n tmp_exp.ini 강화 $2
              remini -n tmp_exp.ini 강화횟수 $2
              remini -n tmp_exp.ini 쿠폰 $2
              remini -n tmp_exp.ini 쿠폰번호 $2
            }
            if (%lenhance_num >= 7) {
              privmsg $gettok(%Zodbot.data,3,32) 쿠폰 강화에 실패하였습니다! 4(배당금의 5%인 $comgen($calc(%lenhance / 20)) $+ 원을 수령합니다!)
              writeini -n tmp_exp.ini 폭파 돈 $calc($readini(tmp_exp.ini,폭파,돈) + $readini(tmp_exp.ini,강화,$2) * 0.95 / 100000000)
              writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + (%lenhance / 20))
              privmsg $gettok(%Zodbot.data,3,32) 통계 집계 후 현재까지 폭파된 금액의 합계는 $comgen($readini(tmp_exp.ini,폭파,돈)) $+ 억 원입니다.              
              remini -n tmp_exp.ini 강화 $2
              remini -n tmp_exp.ini 강화횟수 $2
              remini -n tmp_exp.ini 쿠폰 $2
              remini -n tmp_exp.ini 쿠폰번호 $2
            }
            if ($readini(tmp_exp.ini,폭파,돈) >= 20000000000) {
              privmsg $gettok(%Zodbot.data,3,32) 너님이 폭파금 $comgen(20000000000) $+ 억의 주인공이군여~  $comgen(20000000) $+ 원 줄테니까 이거먹고 떨어져 'ㅅ'
              writeini -n tmp_exp.ini 폭파 돈 1
              writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + 20000000)
            }
            halt
          }
        }
        halt
      }
      if ($3 == 포기) {
        var %lenhance $readini(tmp_exp.ini,강화,$2)
        var %lenhance_num $readini(tmp_exp.ini,강화횟수,$2)
        if (!%lenhance_num || !%lenhance) {
          privmsg $gettok(%Zodbot.data,3,32) 강화를 한번도 시도도 안해보고 포기를 할 셈이냐? 이런 쫌생이.. ㅉㅉ
          halt        
        }
        if (%lenhance_num <= 3) {
          privmsg $gettok(%Zodbot.data,3,32) +3 이하의 강화쿠폰은 포기가 불가능합니다. 기왕 시작하신거 좀 더 저질러 주세요.
          halt
        }
        else {
          if (%lenhance_num <= 6) {
            privmsg $gettok(%Zodbot.data,3,32) + $+ %lenhance_num $+ 의 쿠폰 강화로 배당된 금액의 50%인 $comgen($calc(%lenhance / 2)) $+ 원을 지급합니다. (어휴~ 소심쟁이ㅋㅋ 쫄았냐?ㅋㅋ)
            writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + (%lenhance / 2))
            remini -n tmp_exp.ini 강화 $2
            remini -n tmp_exp.ini 강화횟수 $2
            remini -n tmp_exp.ini 쿠폰 $2
            remini -n tmp_exp.ini 쿠폰번호 $2
          }
          if (%lenhance_num >= 7) {
            privmsg $gettok(%Zodbot.data,3,32) + $+ %lenhance_num $+ 의 쿠폰 강화로 배당된 금액인 $comgen(%lenhance) $+ 원을 지급합니다.
            writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + %lenhance)
            remini -n tmp_exp.ini 강화 $2
            remini -n tmp_exp.ini 강화횟수 $2
            remini -n tmp_exp.ini 쿠폰 $2
            remini -n tmp_exp.ini 쿠폰번호 $2            
          }          
          halt
        }
      }
      else { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰강화,설명) | set %usagelimit 1 | halt }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 도시정보 || $1 == $readini(prefix.ini,%chan,p2) $+ 도시정보 || $1 == $readini(prefix.ini,%chan,p3) $+ 도시정보) {
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,도시정보,설명) | set %usagelimit 1 | halt }
      var %blue.land $2
      if (!$readini(cityi.ini,%blue.land,가격)) { privmsg $gettok(%Zodbot.data,3,32) $josa($2,은는) 이 게임에서 존재하는 도시가 아닙니다. 검색가능한 도시는 http://xeriars.tistory.com/140 에서 참조하시기 바랍니다. | halt }
      var %blue.master $nickdt($readini(cityi.ini,%blue.land,지주))
      if (!%blue.master) { var %blue.master 없음 }
      var %blue.gcost $readini(cityi.ini,%blue.land,기본료)
      var %blue.hcost $int($calc($readini(cityi.ini,%blue.land,호텔) * 0.3))
      var %blue.bcost $int($calc($readini(cityi.ini,%blue.land,빌딩) * 0.3))
      var %blue.pcost $int($calc($readini(cityi.ini,%blue.land,별장) * 0.3))

      var %blue.hamout $readini(cityi.ini,%blue.land,호)
      var %blue.bamout $readini(cityi.ini,%blue.land,빌)
      var %blue.pamout $readini(cityi.ini,%blue.land,별)

      var %blue.guard $readini(cityi.ini,%blue.land,용병수)
      var %blue.lguard $readini(cityi.ini,%blue.land,용병제한)
      if (!%blue.guard) { var %blue.guard 없음 }

      privmsg $gettok(%Zodbot.data,3,32) 도시명 : %blue.land / 가격 : $comgen($readini(cityi.ini,%blue.land,가격)) $+ 원 / 소유주 : %blue.master / 건물상황 : 호텔 $comgen(%blue.hamout) $+ , 빌딩 $comgen(%blue.bamout)) $+ , 별장 $comgen(%blue.pamout) $+ 채 / 용병 제한 : $comgen(%blue.lguard) $+ 명 / 용병고용 : $comgen(%blue.guard) $+ 명
      privmsg $gettok(%Zodbot.data,3,32) 건물제한 : $comgen($readini(cityi.ini,%blue.land,건물제한)) $+ 채 / 호텔건축비 : $comgen($readini(cityi.ini,%blue.land,호텔)) $+ 원 / 빌딩건축비 : $comgen($readini(cityi.ini,%blue.land,빌딩)) $+ 원 / 별장건축비 : $comgen($readini(cityi.ini,%blue.land,별장)) $+ 원
      privmsg $gettok(%Zodbot.data,3,32) 기본료 : $comgen(%blue.gcost) $+ 원 / 호텔이용비 : $comgen(%blue.hcost) $+ 원 / 빌딩이용비 : $comgen(%blue.bcost) $+ 원 / 별장이용비 : $comgen(%blue.pcost) $+ 원 (이용비는 1채당 가격임)
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 프로필 || $1 == $readini(prefix.ini,%chan,p2) $+ 프로필 || $1 == $readini(prefix.ini,%chan,p3) $+ 프로필) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,프로필,설명) | set %usagelimit 1 | halt }    
      if (!$readini(tmp_exp.ini,돈,$2)) { privmsg $gettok(%Zodbot.data,3,32) DB에서 $2 $+ (이)라는 계정을 찾을 수 없습니다. | halt }
      lsort
      var %pro.rank $ini(lrank.ini,돈,$2)
      var %pro.rank_all $ini(lrank.ini,돈,0)
      var %pro.money $readini(tmp_exp.ini,돈,$2)
      var %i 1
      while (%i <= $ini(cityinv.ini,$2,0)) {
        var %pro.ha $readini(cityi.ini,$ini(cityinv.ini,$2,%i),호)
        var %pro.ba $readini(cityi.ini,$ini(cityinv.ini,$2,%i),빌)
        var %pro.pa $readini(cityi.ini,$ini(cityinv.ini,$2,%i),별)      
        var %pro.s $readini(cityi.ini,$ini(cityinv.ini,$2,%i),용병수)
        var %pro.sl $readini(cityi.ini,$ini(cityinv.ini,$2,%i),용병제한)
        var %pro.city %pro.city $+ $chr(44) $ini(cityinv.ini,$2,%i) $+ ( $+ $calc(%pro.ha + %pro.ba + %pro.pa) $+ $chr(44) $+ $int($calc((%pro.s / %pro.sl) * 100)) $+ $chr(37) $+ )
        inc %i
      }
      var %j 1
      var %k 0
      while (%i <= $ini(tmp_exp.ini,쿠폰번호,0)) {
        if ($readini(tmp_exp.ini,쿠폰번호,$ini(tmp_exp.ini,쿠폰번호,1)) == $2) {
          var %pro.coupon %pro.coupon $+ $chr(44) $ini(tmp_exp.ini,쿠폰번호,%i)
          inc %k
          if (%k >= 10) { var %i $ini(tmp_exp.ini,쿠폰번호,0) }
        }
        inc %i
      }
      var %pro.city $mid(%pro.city,3)
      var %pro.coupon $mid(%pro.coupon,3)
      if (!%pro.city) { var %pro.city 없음 }
      if (!%pro.coupon) { var %pro.coupon 없음 }
      privmsg $gettok(%Zodbot.data,3,32) 계정명 : $nickdt($2) / 순위 : %pro.rank_all $+ 명 중 %pro.rank $+ 위 / 소지금액 : $comgen(%pro.money) $+ 원 / 현재 체류중인 도시 : $readini(citya.ini,위치,$2)
      privmsg $gettok(%Zodbot.data,3,32) 소유도시(건축물총합,용병고용률) : %pro.city
      privmsg $gettok(%Zodbot.data,3,32) 소유쿠폰 : %pro.coupon
    } 
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 부르마블 || $1 == $readini(prefix.ini,%chan,p2) $+ 부르마블 || $1 == $readini(prefix.ini,%chan,p3) $+ 부르마블) {
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 계정정보가 없습니다. 먼저 @로또를 실행해주세요. | halt }    
      if (!$readini(login.ini,login,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 로그인 정보가 없습니다. /notice Zod @등록 설정할비밀번호 와 같이 설정하여 주십시요. | halt }
      if ($readini(login.ini,status,%nick) != ok) { privmsg $gettok(%Zodbot.data,3,32) 해당 계정은 로그인 된 상태가 아닙니다. 로그인(/notice Zod @로그인 비밀번호) 후 이용해 주십시요. | halt }
      if ($readini(citya.ini,명단,%nick) != 1) { privmsg $gettok(%Zodbot.data,3,32) 게임참가자 명단에 없는 계정입니다. @쿠폰구매 3 를 입력하시면 초대권을 구매하실 수 있습니다. | halt }
      if ($readini(tmp_exp.ini,돈,%nick) < 10000) { privmsg $gettok(%Zodbot.data,3,32) 소지하신 금액이 1만원을 넘지 않으므로 참여하실 수 없습니다. (현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) | halt }
      if ($2 == 건축) {
        var %blue.land $3
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) 건축할 도시의 이름을 입력하지 않으셨습니다. Usage : @부르마블 건축 도시이름 건축물(호텔,빌딩,별장) 건축수량 | halt }
        if (!$readini(cityi.ini,%blue.land,가격)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 이 게임에서 존재하는 도시가 아닙니다. Usage : @부르마블 건축 도시이름 건축물(호텔,빌딩,별장) 건축수량 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) 건축물의 종류를 입력하지 않으셨습니다. Usage : @부르마블 건축 %blue.land 건축물(호텔,빌딩,별장) 건축수량 | halt }
        if ($4 != 호텔 && $4 != 빌딩 && $4 != 별장) { privmsg $gettok(%Zodbot.data,3,32) 건축물의 종류가 잘못되었습니다. Usage : @부르마블 건축 도시이름 건축물(호텔,빌딩,별장) 건축수량 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) 건축수량을 입력하지 않으셨습니다. Usage : @부르마블 건축 도시이름 건축물(호텔,빌딩,별장) 건축수량 | halt }        
        if ($5 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 건축수량을 입력하지 않으셨습니다. Usage : @부르마블 건축 도시이름 건축물(호텔,빌딩,별장) 건축수량 | halt }
        if (!$readini(cityi.ini,%blue.land,가격)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 이 게임에서 존재하는 도시가 아닙니다. 상상의 도시는 망상할때나 써먹도록. ㅅㄱ | halt }
        if ($readini(cityi.ini,%blue.land,지주) != %nick) { privmsg $gettok(%Zodbot.data,3,32)  $+ $nickdt(%nick) $+ 님은 %blue.land $+ 의 소유주가 아니므로 건축이 불가능합니다. (소유주 : $nickdt($readini(cityi.ini,%blue.land,지주)) $+ ) | halt }
        var %blue.money $readini(tmp_exp.ini,돈,%nick)
        var %blue.zone $readini(citya.ini,위치,%nick)
        if (%blue.zone != %blue.land) { privmsg $gettok(%Zodbot.data,3,32) 현재 %blue.zone $+ 에서 체류중이므로 %blue.land $+ 에서의 건축이 불가능합니다. 건축은 체류중인 도시에서만 가능합니다. | halt }
        if (%nick != $me && $readini(citya.ini,상태,%nick) != 1) { privmsg $gettok(%Zodbot.data,3,32) 건축허가가 필요합니다. 다음번 %blue.land 방문시 허가가 이루어 집니다. | halt }
        var %blue.hamout $readini(cityi.ini,%blue.land,호)
        var %blue.bamout $readini(cityi.ini,%blue.land,빌)
        var %blue.pamout $readini(cityi.ini,%blue.land,별)
        var %blue.amount $calc(%blue.hamout + %blue.bamout + %blue.pamout)
        var %blue.limit $readini(cityi.ini,%blue.land,건물제한)
        if ($calc(%blue.amount + $5) > %blue.limit) {
          privmsg $gettok(%Zodbot.data,3,32) 현재 %blue.zone $+ 의 건축물 제한량은 %blue.limit $+ 채 입니다. 현재 호텔 %blue.hamout $+ , 빌딩 %blue.bamout $+ , 별장 %blue.pamout $+ 채를 보유하고 있으므로 건설이 불가능합니다.
          halt
        }
        var %blue.cost $calc($readini(cityi.ini,%blue.land,$4) * $5)
        if (%blue.money < %blue.cost) { privmsg $gettok(%Zodbot.data,3,32) 건축하시기에는 돈이 부족합니다. 입력하신 %blue.land $+ 의 가격은 $comgen(%blue.cost) $+ 원 입니다. (현재 잔액 : $comgen(%blue.money) $+ 원) | halt }
        else {
          writeini -n tmp_exp.ini 돈 %nick $calc(%blue.money - %blue.cost)
          writeini -n cityi.ini %blue.land $mid($4,1,2) $calc($readini(cityi.ini,%blue.land,$mid($4,1,2)) + $5)
          var %blue.hamout $readini(cityi.ini,%blue.land,호)
          var %blue.bamout $readini(cityi.ini,%blue.land,빌)
          var %blue.pamout $readini(cityi.ini,%blue.land,별)
          privmsg $gettok(%Zodbot.data,3,32)  $+ %blue.land $+ 에 $josa($4,을를)  $comgen($5) $+ 채 건축하였습니다! / 총 소요금액 : $comgen(%blue.cost) $+ 원 / 잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원 / 건축상태 : 호텔 %blue.hamout $+ , 빌딩 %blue.bamout $+ , 별장 %blue.pamout $+ 채
          halt
        }
      }
      if ($2 == 구매) {
        var %blue.land $3      
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) 구매하려는 도시의 이름을 입력하지 않으셨습니다. | halt }
        if (!$readini(cityi.ini,%blue.land,가격)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 이 게임에서 존재하는 도시가 아닙니다. 상상의 도시는 망상할때나 써먹도록. ㅅㄱ | halt }
        if ($readini(cityi.ini,%blue.land,지주)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 이미 소유주( $+ $nickdt($readini(cityi.ini,%blue.land,지주)) $+ 님)가 있으므로 구매가 불가능합니다. | halt }
        var %blue.money $readini(tmp_exp.ini,돈,%nick)
        var %blue.cost $readini(cityi.ini,%blue.land,가격)
        var %blue.zone $readini(citya.ini,위치,%nick)
        var %blue.possess $ini(cityinv.ini,%nick,0)
        if (%blue.possess >= 7) {
          if (%blue.possess >= $readini(citya.ini,특전,%nick)) {
            privmsg $gettok(%Zodbot.data,3,32) 베타테스터는 $readini(citya.ini,특전,%nick) $+ 개 이상의 도시를 소유할 수 없습니다.
            halt        
          }
          if (%blue.possess <= $readini(citya.ini,특전,%nick)) {
            goto bluesp
          }
          else {
            privmsg $gettok(%Zodbot.data,3,32) 7개 이상의 도시는 소유할 수 없습니다.
            halt
          }
          :bluesp
        }
        if (%blue.zone != %blue.land) { privmsg $gettok(%Zodbot.data,3,32) 현재 %blue.zone $+ 에서 체류중이므로 %blue.land $+ 의 구매가 불가능합니다. 구매는 체류중인 도시에서만 가능합니다. | halt }
        if (%blue.money < %blue.cost) { privmsg $gettok(%Zodbot.data,3,32) 구매하시기에는 돈이 부족합니다. 입력하신 %blue.land $+ 의 가격은 $comgen(%blue.cost) $+ 원 입니다. (현재 잔액 : $comgen(%blue.money) $+ 원) | halt }
        else {
          writeini -n tmp_exp.ini 돈 %nick $calc(%blue.money - %blue.cost)
          writeini -n cityi.ini %blue.land 지주 %nick
          writeini -n citya.ini 상태 %nick 2
          writeini -n cityinv.ini %nick %blue.land 1
          privmsg $gettok(%Zodbot.data,3,32)  $+ %blue.land $+ 의 구매가 완료되었습니다! 다음번에 다시 이 도시에 방문하시면 건물의 건축이 가능합니다! (잔액 : $comgen($calc(%blue.money - %blue.cost)) $+ 원)
        }
        halt
      }
      else {
        var %blue.island $rand(1,50)
        if (%blue.island == 1) {
          privmsg $gettok(%Zodbot.data,3,32) 4무인도에 갇히셨습니다! 모든 연락이 두절되어 1분간 Zod의 사용이 중지됩니다.
          writeini -n caction.ini 영구블랙 $address(%nick,2) 1
          timer금지 $+ %nick 1 60 remini -n caction.ini 영구블랙 $address(%nick,2)
          halt
        }
        if (!$readini(citya.ini,노선,%nick)) { var %blue.gold $rand(1,10) }
        if (%nick == Thanatos && %gset == 1) { var %blue.gold 1 | set %gset 2 | var %blue.warn 1 }
        if (%blue.gold == 1) {
          var %itm1 $readini(percent.ini,황금열쇠,1), %itm2 $readini(percent.ini,황금열쇠,2), %itm3 $readini(percent.ini,황금열쇠,3), %itm4 $readini(percent.ini,황금열쇠,4)
          var %itm5 $readini(percent.ini,황금열쇠,5), %itm6 $readini(percent.ini,황금열쇠,6), %itm7 $readini(percent.ini,황금열쇠,7)
          var %bitem = $mid($remove($shuffle($str(a,%itm1) $+ $str(b,%itm2) $+ $str(c,%itm3) $+ $str(d,%itm4) $+ $str(e,%itm5) $+ $str(f,%itm6) $+ $str(g,%itm7)) ,$chr(32)),$rand(1,100),1)
          if (%nick == $me && %bitem == e) { var %bitem f }
          if (%blue.warn == 1) { var %bitem g }
          if (%bitem == a) {
            var %blue.goto $ini(cityi.ini,$rand(1,$ini(cityi.ini,0)))
            if ($readini(cityi.ini,%blue.goto,지주) && $readini(cityi.ini,%blue.goto,지주) != %nick) { var %blue.zot (4너님 이제 좆됨 ㅋㅋㅋ1) }
            writeini -n citya.ini 노선 %nick %blue.goto
            writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + 1000)
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 콩코드 여객기는 버리고, 걸어서 %blue.goto $+ 에 가시오. (여비 1,000원 지급) 다음번 @부르마블에 적용. %blue.zot
            halt
          }
          if (%bitem == b) {
            var %blue.bank $rand(100000,9999999)
            var %blue.gmoney $readini(tmp_exp.ini,돈,%nick)
            if (%blue.gmoney < %blue.bank) { 
              var %blue.bank $calc(%blue.bank - 100000)
              var %blue.gmoney $calc(%blue.bank + 10000)
            }
            writeini -n tmp_exp.ini 돈 %nick $calc(%blue.gmoney - %blue.bank)
            writeini -n citya.ini 기금 all $calc($readini(citya.ini,기금,all) + %blue.bank)
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 불우이웃을 도웁시다! 발전기금으로 $comgen(%blue.bank) $+ 원을 징수함. (현재 잔액: $comgen($readini(tmp_exp.ini,돈,%nick)) / 기금잔액 : $comgen($readini(citya.ini,기금,all)) $+ 원)
            halt
          }
          if (%bitem == c) {
            var %blue.goto $ini(cityinv.ini,%nick,$rand(1,$ini(cityinv.ini,%nick,0)))
            writeini -n citya.ini 노선 %nick %blue.goto
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 현재 $nickdt(%nick) $+ 님이 소유중인 %blue.goto $+ 로 가시오. 다음번 @부르마블에 적용.
            halt
          }
          if (%bitem == d) {
            var %blue.bank $readini(citya.ini,기금,all)
            writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + %blue.bank)
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 불우이웃이시군요! 현재 모아둔 발전 기금 $comgen(%blue.bank) $+ 원을 수여합니다! 잘먹고 잘사세요! (잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원)
            writeini -n citya.ini 기금 all 10000
            halt
          }
          if (%bitem == e) {
            var %blue.fsell $ini(cityinv.ini,%nick,$rand(1,$ini(cityinv.ini,%nick,0)))
            var %bank.cost $int($calc(($readini(cityi.ini,%blue.fsell,가격) + $readini(cityi.ini,%blue.fsell,호) * $readini(cityi.ini,%blue.fsell,호텔) + $readini(cityi.ini,%blue.fsell,빌) * $readini(cityi.ini,%blue.fsell,빌딩) + $readini(cityi.ini,%blue.fsell,별) * $readini(cityi.ini,%blue.fsell,별장)) * 0.8))
            var %bank.ha $readini(cityi.ini,%blue.fsell,호)
            var %bank.ba $readini(cityi.ini,%blue.fsell,빌)
            var %bank.pa $readini(cityi.ini,%blue.fsell,별)
            remini -n cityi.ini %blue.fsell 지주
            remini -n cityi.ini %blue.fsell 용병수
            remini -n cityi.ini %blue.fsell 보병
            remini -n cityi.ini %blue.fsell 기마병
            remini -n cityi.ini %blue.fsell 중갑보병
            remini -n cityinv.ini %nick %blue.fsell
            writeini -n cityi.ini %blue.fsell 호 $chr(48)
            writeini -n cityi.ini %blue.fsell 빌 $chr(48)
            writeini -n cityi.ini %blue.fsell 별 $chr(48)
            writeini -n tmp_exp.ini 돈 %nick $int($calc($readini(tmp_exp.ini,돈,%nick) + %bank.cost))
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 현재 $nickdt(%nick) $+ 님이 소유중인 %blue.fsell $+ 을 강제 매각합니다.
            privmsg $gettok(%Zodbot.data,3,32) 매각 대상인  %blue.fsell $+ 의 부지( $+ $comgen($readini(cityi.ini,%blue.fsell,가격)) $+ 원)와 호텔 %bank.ha $+ , 빌딩 %bank.ba $+ , 별장 %bank.pa $+ 채를 80% 가격인 $comgen(%bank.cost) $+ 원에 매각하였습니다. (잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원)
            halt            
          }
          if (%bitem == f) {
            writeini -n citya.ini 우대권 %nick $calc($readini(citya.ini,우대권,%nick) + 3)
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 우대권 3장 획득!! 차후 타인의 도시에 체류중일때, 이용요금을 면제합니다!
            halt
          }
          if (%bitem == g) {
            var %blue.gmoney $readini(tmp_exp.ini,돈,%nick)
            var %i 1
            while (%i <= $ini(cityinv.ini,%nick,0)) {
              var %blue.target $ini(cityinv.ini,%nick,%i)
              var %blue.cost $calc(%blue.cost + $int($calc(($readini(cityi.ini,%blue.target,가격) + $readini(cityi.ini,%blue.target,호) * $readini(cityi.ini,%blue.target,호텔) + $readini(cityi.ini,%blue.target,빌) * $readini(cityi.ini,%blue.target,빌딩) + $readini(cityi.ini,%blue.target,별) * $readini(cityi.ini,%blue.target,별장)) / 10)))
              var %blue.target2 %blue.target2 $+ $chr(44) %blue.target
              inc %i
            }
            if (%blue.gmoney < %blue.cost) { 
              var %blue.cost $calc(%blue.cost - 100000)
              var %blue.gmoney $calc(%blue.bank + 10000)
            }
            writeini -n tmp_exp.ini 돈 %nick $calc(%blue.gmoney - %blue.cost)              
            privmsg $gettok(%Zodbot.data,3,32) [황금열쇠!] 소유세 특별 납부기간입니다! 소유하신 $mid(%blue.target2,3) 의 세금으로 $comgen(%blue.cost) $+ 원을 청구합니다! (잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원)
            halt
          }
        }
        var %blue.land $ini(cityi.ini,$rand(2,$ini(cityi.ini,0)))
        if ($readini(citya.ini,노선,%nick)) {
          var %blue.land $readini(citya.ini,노선,%nick)
          remini -n citya.ini 노선 %nick
        }
        if (%mset == 1) {
          set %mset 2
          var %blue.land Zod
        }
        writeini -n citya.ini 위치 %nick %blue.land
        if (!$readini(cityi.ini,%blue.land,지주)) {
          privmsg $gettok(%Zodbot.data,3,32) 도시명 : %blue.land / 가격 : $comgen($readini(cityi.ini,%blue.land,가격)) $+ 원 / 건물제한 : $comgen($readini(cityi.ini,%blue.land,건물제한)) $+ 채 / 호텔건축비 : $comgen($readini(cityi.ini,%blue.land,호텔)) $+ 원 / 용병고용 제한 : $comgen($readini(cityi.ini,%blue.land,용병제한)) $+ 명
          privmsg $gettok(%Zodbot.data,3,32) 주인이 없는 도시입니다. 구매하시려면 @부르마블 구매 %blue.land 을(를) 입력하시기 바랍니다.
          halt
        }
        if ($readini(cityi.ini,%blue.land,지주)) {
          var %blue.master $readini(cityi.ini,%blue.land,지주)
          if (%blue.master == %nick) {
            privmsg $gettok(%Zodbot.data,3,32) 도시명 : %blue.land / 건물제한 : $comgen($readini(cityi.ini,%blue.land,건물제한)) $+ 채 / 호텔건축비 : $comgen($readini(cityi.ini,%blue.land,호텔)) $+ 원 / 빌딩건축비 : $comgen($readini(cityi.ini,%blue.land,빌딩)) $+ 원 / 별장건축비 : $comgen($readini(cityi.ini,%blue.land,별장)) $+ 원
            privmsg $gettok(%Zodbot.data,3,32) 현재 소유중인 도시입니다. 건축을 원하시면 @부르마블 건축 %blue.land 건물명(호텔,빌딩,별장) 건축수량 을 입력하시기 바랍니다.          
            writeini -n citya.ini 상태 %nick 1
            halt
          }
          writeini -n citya.ini 상태 %nick 2
          var %blue.gcost $readini(cityi.ini,%blue.land,기본료)
          var %blue.hcost $int($calc($readini(cityi.ini,%blue.land,호텔) * 0.3))
          var %blue.bcost $int($calc($readini(cityi.ini,%blue.land,빌딩) * 0.3))
          var %blue.pcost $int($calc($readini(cityi.ini,%blue.land,별장) * 0.3))

          var %blue.hamout $readini(cityi.ini,%blue.land,호)
          var %blue.bamout $readini(cityi.ini,%blue.land,빌)
          var %blue.pamout $readini(cityi.ini,%blue.land,별)
          var %blue.result $calc(%blue.hcost * %blue.hamout + %blue.bcost * %blue.bamout + %blue.pcost * %blue.pamout + %blue.gcost)
          var %blue.money $readini(tmp_exp.ini,돈,%nick)
          var %blue.calc $calc(%blue.money - %blue.result)
          if (%blue.calc <= 0) { var %blue.calc $chr(48) }
          sockwrite -nt Zodbot notice %blue.master : $+ [부르마블 방송] %blue.master $+ 님 소유인 %blue.land $+ 에 %nick $+ 님이 걸리셨습니다.
          privmsg $gettok(%Zodbot.data,3,32) 도시명 : %blue.land / 소유주 : $nickdt(%blue.master) / 건물상황 : 호텔 $comgen(%blue.hamout) $+ , 빌딩 $comgen(%blue.bamout)) $+ , 별장 $comgen(%blue.pamout) $+ 채
          privmsg $gettok(%Zodbot.data,3,32) 기본료 : $comgen(%blue.gcost) $+ 원 / 호텔이용비 : $comgen(%blue.hcost) $+ 원 / 빌딩이용비 : $comgen(%blue.bcost) $+ 원 / 별장이용비 : $comgen(%blue.pcost) $+ 원 (이용비는 1채당 가격임)
          if (%blue.calc > 0) {
            if ($readini(citya.ini,우대권,%nick) && $readini(citya.ini,우대권,%nick) > 0) {
              writeini -n citya.ini 우대권 %nick $calc($readini(citya.ini,우대권,%nick) - 1)
              privmsg $gettok(%Zodbot.data,3,32) 총 이용료(기본료+건물이용비) $comgen(%blue.result) $+ 원을 우대권 사용으로 이용비를 면제받았습니다! (잔여 우대권 : $readini(citya.ini,우대권,%nick) $+ 장)
            }
            else {
              privmsg $gettok(%Zodbot.data,3,32) 총 이용료(기본료+건물이용비) $comgen(%blue.result) $+ 원을 $nickdt(%nick) $+ 님의 계정에서 인출하였습니다. (잔액 : $comgen(%blue.calc) $+ 원)            
              writeini -n tmp_exp.ini 돈 %nick %blue.calc
              writeini -n tmp_exp.ini 돈 %blue.master $calc($readini(tmp_exp.ini,돈,%blue.master) + %blue.result)
            }
          }
          else {
            privmsg $gettok(%Zodbot.data,3,32) 총 이용료(기본료+건물이용비) $comgen(%blue.result) $+ 원을 지불 할 수 없는 $nickdt(%nick) $+ 님이 파산하셨습니다! 인도주의 차원에서 10,000원을 뺀 나머지 재산( $+ $comgen($calc(%blue.money - 10000)) $+ 원)을 몰수합니다. (잔액 : 10,000원)
            writeini -n tmp_exp.ini 돈 %nick 10000
          }
        }
        halt
      }
      halt          
    }  
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 쿠폰구매 || $1 == $readini(prefix.ini,%chan,p2) $+ 쿠폰구매 || $1 == $readini(prefix.ini,%chan,p3) $+ 쿠폰구매) {
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 계정정보가 없습니다. 먼저 @로또 를 실행해주세요. | halt }    
      if (!$readini(login.ini,login,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 로그인 정보가 없습니다. /notice Zod @등록 설정할비밀번호 와 같이 설정하여 주십시요. | halt }
      if ($readini(login.ini,status,%nick) != ok) { privmsg $gettok(%Zodbot.data,3,32) 해당 계정은 로그인 된 상태가 아닙니다. 로그인(/notice Zod @로그인 비밀번호) 후 이용해 주십시요. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰구매,설명) | set %usagelimit 1 | halt }
      if ($2 !isnum) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰구매,설명) | set %usagelimit 1 | halt }      
      if ($2 !isnum 1-3) { privmsg $gettok(%Zodbot.data,3,32) 구현되지 않았거나 잘못된 쿠폰을 선택하셨습니다. | set %usagelimit 1 | halt }
      if ($2 == 1 && $readini(tmp_exp.ini,수량제한,1) <= 0) { privmsg $gettok(%Zodbot.data,3,32) 현재 구매 가능한 강화쿠폰이 없습니다. $replace($duration($timer(itmsply).secs),mins,분,secs,초,min,분,sec,초) 후에 다시 이용해주세요. | set %usagelimit 1 | halt }
      if ($2 == 2 && $readini(tmp_exp.ini,수량제한,2) <= 0) { privmsg $gettok(%Zodbot.data,3,32) 현재 구매 가능한 고가형 쿠폰이 없습니다. $replace($duration($timer(itmsply).secs),mins,분,secs,초,min,분,sec,초) 후에 다시 이용해주세요. | set %usagelimit 1 | halt }
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님의 현재 소지금을 DB에서 읽을 수 없습니다. | set %usagelimit 1 | halt }
      if ($2 == 1 && $readini(tmp_exp.ini,돈,%nick) <= 1000) { privmsg $gettok(%Zodbot.data,3,32) 돈이 모자랍니다. 저가형 쿠폰의 가격은 $comgen(1000) $+ 원 입니다. (현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) | set %usagelimit 1 | halt }
      if ($2 == 2 && $readini(tmp_exp.ini,돈,%nick) <= 1000000) { privmsg $gettok(%Zodbot.data,3,32) 돈이 모자랍니다. 고가형 쿠폰의 가격은 $comgen(1000000) $+ 원 입니다. (현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) | set %usagelimit 1 | halt }
      if ($2 == 3 && $readini(tmp_exp.ini,돈,%nick) <= 1000000) { privmsg $gettok(%Zodbot.data,3,32) 돈이 모자랍니다. 부르마블 쿠폰의 가격은 $comgen(1000000) $+ 원 입니다. (현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) | set %usagelimit 1 | halt }
      else {
        if ($2 == 1) { var %cobonus z | var %coupontype 강화쿠폰 | writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) - 1000) | writeini -n tmp_exp.ini 수량제한 1 $calc($readini(tmp_exp.ini,수량제한,1) - 1) }
        if ($2 == 3) { var %cobonus x | var %coupontype 부르마블 | writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) - 1000000) | writeini -n tmp_exp.ini 수량제한 3 $calc($readini(tmp_exp.ini,수량제한,3) - 1) }
        if ($2 == 2) { var %cobonus $rand(a,j) | var %coupontype 고가형 | writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) - 1000000) | writeini -n tmp_exp.ini 수량제한 2 $calc($readini(tmp_exp.ini,수량제한,2) - 1) }
        var %lot_time $readini(tmp_exp.ini,당첨,회차)
        if ($len(%lot_time) == 1) { var %lot_time $chr(48) $+ %lot_time }
        var %coupon_num $asctime(yyyy) $+ %lot_time $+ 11 $+ %cobonus
        var %lcoupon $gettok($gettok($amgine(%coupon_num),5,58),1,47)
        writeini -n tmp_exp.ini 쿠폰 %lcoupon %cobonus
        writeini -n tmp_exp.ini 쿠폰번호 %lcoupon %nick
        if ($2 isnum 1-2) {
          privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님의 쿠폰구매가 완료되었습니다. (지출 후 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) / $iif($2 == 1,강화 쿠폰의 남은수량 : $readini(tmp_exp.ini,수량제한,1), 고가형 쿠폰의 남은수량 : $readini(tmp_exp.ini,수량제한,2)) / 발급된 쿠폰번호 : %lcoupon ( $+ %coupontype $+ )
        }
        if ($2 == 3) {
          privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님의 쿠폰구매가 완료되었습니다. (지출 후 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) / 부르마블 쿠폰의 남은수량 : $readini(tmp_exp.ini,수량제한,3) / 발급된 쿠폰번호 : %lcoupon ( $+ %coupontype $+ )        
        }
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 은행 || $1 == $readini(prefix.ini,%chan,p2) $+ 은행 || $1 == $readini(prefix.ini,%chan,p3) $+ 은행) {
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 계정정보가 없습니다. 먼저 @로또 를 실행해주세요. | halt }
      if (!$readini(login.ini,login,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 로그인 정보가 없습니다. /notice Zod @등록 설정할비밀번호 와 같이 설정하여 주십시요. | halt }
      if ($readini(login.ini,status,%nick) != ok) { privmsg $gettok(%Zodbot.data,3,32) 해당 계정은 로그인 된 상태가 아닙니다. 로그인(/notice Zod @로그인 비밀번호) 후 이용해 주십시요. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,은행,설명) | set %usagelimit 1 | halt }
      if ($2 == 송금) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,은행,설명1) | set %usagelimit 1 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,은행,설명1) | set %usagelimit 1 | halt }
        if (!$readini(tmp_exp.ini,돈,$3)) { privmsg $gettok(%Zodbot.data,3,32) 존재하지 않는 계정에 송금 할 수 없습니다. 송금할 계정을 다시 한번 확인하여 주십시요. | halt }
        if ($readini(tmp_exp.ini,돈,%nick) <= 1000000) { privmsg $gettok(%Zodbot.data,3,32) 잔액이 100만원 이하인 계정은 타인에게 송금이 불가능합니다. | halt }
        var %lotto.smoney $4
        var %lotto.tax $int($calc(%lotto.smoney * 0.01))
        var %lotto.tax2 1 $+ $chr(37) ( $+ $comgen(%lotto.tax) $+ 원)        
        if ($4 >= 1000000000) {
          var %lotto.tax $int($calc(%lotto.smoney * 0.05))
          var %lotto.tax2 5 $+ $chr(37) ( $+ $comgen(%lotto.tax) $+ 원)        
        }
        if (%lotto.tax < 3000) { var %lotto.tax 3000 | var %lotto.tax2 $comgen(3000) $+ 원 }
        var %lotto.limit $int($calc(%lotto.smoney * 0.5))
        if ($calc($readini(tmp_exp.ini,돈,%nick) * 0.5) < %lotto.limit) {
          privmsg $gettok(%Zodbot.data,3,32) 송금 한도금액을 초과하였습니다. 송금액은 현 계정 잔액의 50%( $+ $comgen($calc($readini(tmp_exp.ini,돈,%nick) * 0.5)) $+ 원)을 초과해서는 안됩니다.
          halt
        }
        if ($calc($readini(tmp_exp.ini,돈,%nick) + %lotto.tax) < $4) {
          privmsg $gettok(%Zodbot.data,3,32) 잔액이 부족합니다. $nickdt(%nick) $+ 님 잔액 : $readini(tmp_exp.ini,돈,%nick) / 이체금액 : $comgen(%lotto.smoney) $+ 원 / 수수료 : $comgen(%lotto.tax) $+ 원 / 총 $comgen($calc(%lotto.smoney + %lotto.tax)) $+ 원이 필요합니다.
          halt
        }
        else {
          privmsg $gettok(%Zodbot.data,3,32)  $+ $comgen(%lotto.smoney) $+ 원을 $nickdt($3) $+ 님께 송금합니다. 수수료는 %lotto.tax2 입니다.
          writeini -n tmp_exp.ini 돈 %nick $int($calc($readini(tmp_exp.ini,돈,%nick) - %lotto.smoney - %lotto.tax))
          writeini -n tmp_exp.ini 돈 $3 $int($calc($readini(tmp_exp.ini,돈,$3) + %lotto.smoney))
          privmsg $gettok(%Zodbot.data,3,32) 처리결과가 완료 되었습니다. $nickdt(%nick) $+ 님 잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원 / $nickdt($3) $+ 님 잔액 : $comgen($readini(tmp_exp.ini,돈,$3)) $+ 원
          halt
        }
      }
      if ($2 == 잔액확인) {
        privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님의 현재 잔액은 $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원 입니다.
        halt
      }
      if ($2 == 매각) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,은행,설명2) | set %usagelimit 1 | halt }
        if (!$readini(cityinv.ini,%nick,$3)) { privmsg $gettok(%Zodbot.data,3,32) $josa($3,은는) 현재 $nickdt(%nick) $+ 님이 소유중인 도시가 아니므로 매각이 불가능합니다. | halt }
        if (%blue.target == $3) { privmsg $gettok(%Zodbot.data,3,32) 공격이 예정된 도시는 매각이 불가능합니다. | halt }
        else {
          var %bank.cost $int($calc(($readini(cityi.ini,$3,가격) + $readini(cityi.ini,$3,호) * $readini(cityi.ini,$3,호텔) + $readini(cityi.ini,$3,빌) * $readini(cityi.ini,$3,빌딩) + $readini(cityi.ini,$3,별) * $readini(cityi.ini,$3,별장)) / 2))
          var %bank.ha $readini(cityi.ini,$3,호)
          var %bank.ba $readini(cityi.ini,$3,빌)
          var %bank.pa $readini(cityi.ini,$3,별)
          remini -n cityi.ini $3 지주
          remini -n cityi.ini %blue.fsell 용병수
          remini -n cityi.ini %blue.fsell 보병
          remini -n cityi.ini %blue.fsell 기마병
          remini -n cityi.ini %blue.fsell 중갑보병          
          remini -n cityinv.ini %nick $3
          writeini -n cityi.ini $3 호 $chr(48)
          writeini -n cityi.ini $3 빌 $chr(48)
          writeini -n cityi.ini $3 별 $chr(48)
          writeini -n tmp_exp.ini 돈 %nick $int($calc($readini(tmp_exp.ini,돈,%nick) + %bank.cost))
          privmsg $gettok(%Zodbot.data,3,32) 요청하신 $3 $+ 의 부지( $+ $comgen($readini(cityi.ini,$3,가격)) $+ 원)와 호텔 %bank.ha $+ , 빌딩 %bank.ba $+ , 별장 %bank.pa $+ 채를 50% 가격인 $comgen(%bank.cost) $+ 원에 매입하였습니다. (잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원)
          halt
        }
      }
      if ($2 == 모병) {
        if (!$3) { privmsg $gettok(%Zodbot.data,3,32) 도시이름을 입력하지 않으셨습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if (!$readini(cityi.ini,$3,가격)) { privmsg $gettok(%Zodbot.data,3,32)  $josa($3,은는) 이 게임에 존재하는 도시가 아닙니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if ($readini(cityi.ini,$3,지주) != %nick) { privmsg $gettok(%Zodbot.data,3,32)  %nick $+ 님은 $josa($3,을를) 소유하고 있지 않습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if (!$4) { privmsg $gettok(%Zodbot.data,3,32 병사종류를 입력하지 않으셨습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if ($4 != 보병 && $4 != 기마병 && $4 != 중갑보병) { privmsg $gettok(%Zodbot.data,3,32) 병사의 종류가 올바르지 않습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if (!$5) { privmsg $gettok(%Zodbot.data,3,32) 고용수량을 입력하지 않으셨습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        if ($5 !isnum) { privmsg $gettok(%Zodbot.data,3,32) 고용수량이 정확하지 않습니다. Usage : @은행 모병 도시이름 병사종류(보병,기마병,중갑보병) 고용수량 | halt }
        var %blue.slimit $readini(cityi.ini,$3,용병제한)
        if (%blue.slimit < $5) { privmsg $gettok(%Zodbot.data,3,32) 고용수치를 초과하셨습니다. 현재 $3 $+ 의 용병고용 제한수치는 $comgen(%blue.slimit) $+ 명입니다. | halt }
        var %blue.slimit2 $readini(cityi.ini,$3,용병수)
        if (%blue.slimit < $calc($5 + %blue.slimit2)) { privmsg $gettok(%Zodbot.data,3,32) 고용수치를 초과하셨습니다. 현재 $3 $+ 의 용병고용 제한수치는 $comgen(%blue.slimit) $+ 명 이며, 고용된 용병수는 $comgen(%blue.slimit2) $+ 명 입니다. | halt }
        if ($4 == 보병) { var %blue.soldier 1000 }
        if ($4 == 기마병) { var %blue.soldier 2000 }
        if ($4 == 중갑보병) { var %blue.soldier 3000 }
        var %blue.scost $calc(%blue.soldier * $5)
        var %blue.money $readini(tmp_exp.ini,돈,%nick)
        if (%blue.scost > %blue.money) {
          privmsg $gettok(%Zodbot.data,3,32) 총 고용비용인 $comgen(%blue.scost) $+ 원보다 현재 소유하신 돈 $comgen(%blue.money) $+ 이 부족하므로 고용하실 수 없습니다. ( $+ $4 1명당 고용비용 : $comgen(%blue.soldier) $+ 원)
          halt
        }
        writeini -n cityi.ini $3 용병수 $calc(%blue.slimit2 + $5)
        writeini -n cityi.ini $3 $4 $calc($5 + $readini(cityi.ini,$3,$4))
        writeini -n tmp_exp.ini 돈 %nick $calc(%blue.money - %blue.scost)
        privmsg $gettok(%Zodbot.data,3,32)  $+ $3 $+ 에 $4 $comgen($5) $+ 명의 고용이 완료되었습니다. 총 고용비용은 $comgen(%blue.scost) $+ 원입니다. (잔액 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원)
        halt
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 쿠폰 || $1 == $readini(prefix.ini,%chan,p2) $+ 쿠폰 || $1 == $readini(prefix.ini,%chan,p3) $+ 쿠폰) {
      if ($chr(91) isin %nick || $chr(93) isin %nick) { privmsg $gettok(%Zodbot.data,3,32) 현재 사용중이신 Nick에 $chr(91) 또는 $chr(93) 과 같은 문자가 포함되어 있으면 정상적인 동작을 보장하지 않습니다. Nick 변경 후 다시 시작해주세요. | halt }
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if (!$readini(tmp_exp.ini,돈,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 계정정보가 없습니다. 먼저 @로또 를 실행해주세요. | halt }
      if (!$readini(login.ini,login,%nick)) { privmsg $gettok(%Zodbot.data,3,32) 로그인 정보가 없습니다. /notice Zod @등록 설정할비밀번호 와 같이 설정하여 주십시요. | halt }
      if ($readini(login.ini,status,%nick) != ok) { privmsg $gettok(%Zodbot.data,3,32) 해당 계정은 로그인 된 상태가 아닙니다. 로그인(/notice Zod @로그인 비밀번호) 후 이용해 주십시요. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) Usage : $readini(cmdlimit.ini,쿠폰,설명) | set %usagelimit 1 | halt }
      if (!$readini(tmp_exp.ini,쿠폰,$2)) { privmsg $gettok(%Zodbot.data,3,32) 쿠폰번호 형식이 잘못되었거나 정상적으로 발급된 쿠폰이 아닙니다. | set %usagelimit 1 | halt }
      if ($readini(tmp_exp.ini,쿠폰번호,$2) != %nick) { 
        privmsg $gettok(%Zodbot.data,3,32) 너님 쓰라고 발급된 쿠폰이 아닐텐데? s( ─━┘Д└━─)z
        halt
      }
      if ($readini(tmp_exp.ini,쿠폰,$2) == x) {
        writeini -n citya.ini 명단 %nick 1      
        privmsg $gettok(%Zodbot.data,3,32) 부르마블 초대권 발급이 완료되었습니다. 이제 @부르마블을 입력하시면 이용하실 수 있습니다!
        remini -n tmp_exp.ini 쿠폰번호 $2
        remini -n tmp_exp.ini 쿠폰 $2
        halt
      }
      if ($readini(tmp_exp.ini,쿠폰,$2) == z) { privmsg $gettok(%Zodbot.data,3,32) 입력하신 쿠폰번호는 강화용 쿠폰이므로 강화 용도로만 사용이 가능합니다. @쿠폰강화 를 입력하세요. | set %usagelimit 1 | halt }
      privmsg $gettok(%Zodbot.data,3,32) " $+ $2 $+ ( $+ $iif($readini(tmp_exp.ini,쿠폰,$2) isnum,저가형,고가형) $+ )" 쿠폰이 정상적으로 사용되었습니다.
      if ($readini(tmp_exp.ini,쿠폰,$2) isnum 3-6) {
        privmsg $gettok(%Zodbot.data,3,32) 결과 : 꽝! ㅋㅋㅋㅋㅋㅋㅋ (づ `∀´)∠)))
      }
      else {
        if ($readini(tmp_exp.ini,쿠폰,$2) isnum) {
          var %itm1 $readini(percent.ini,쿠폰,1), %itm2 $readini(percent.ini,쿠폰,2), %itm3 $readini(percent.ini,쿠폰,3), %itm4 $readini(percent.ini,쿠폰,4)
          var %itm5 $readini(percent.ini,쿠폰,5), %itm6 $readini(percent.ini,쿠폰,6), %itm7 $readini(percent.ini,쿠폰,7), %itm8 $readini(percent.ini,쿠폰,8)
          var %itm9 $readini(percent.ini,쿠폰,9), %itm10 $readini(percent.ini,쿠폰,10), %itm11 $readini(percent.ini,쿠폰,11)
          var %citem = $mid($remove($shuffle($str(a,%itm1) $+ $str(b,%itm2) $+ $str(c,%itm3) $+ $str(d,%itm4) $+ $str(e,%itm5) $+ $str(f,%itm6) $+ $str(g,%itm7) $+ $str(h,%itm8) $+ $str(i,%itm9) $+ $str(j,%itm10) $+ $str(k,%itm11)) ,$chr(32)),$rand(1,100),1)
        }
        if ($readini(tmp_exp.ini,쿠폰,$2) !isnum) {
          var %itm1 $readini(percent.ini,고급쿠폰,1), %itm2 $readini(percent.ini,고급쿠폰,2), %itm3 $readini(percent.ini,고급쿠폰,3), %itm4 $readini(percent.ini,고급쿠폰,4)
          var %itm5 $readini(percent.ini,고급쿠폰,5), %itm6 $readini(percent.ini,고급쿠폰,6), %itm7 $readini(percent.ini,고급쿠폰,7), %itm8 $readini(percent.ini,고급쿠폰,8)
          var %itm9 $readini(percent.ini,고급쿠폰,9), %itm10 $readini(percent.ini,고급쿠폰,10), %itm11 $readini(percent.ini,고급쿠폰,11), %itm12 $readini(percent.ini,고급쿠폰,12)
          var %citem = $mid($remove($shuffle($str(a,%itm1) $+ $str(b,%itm2) $+ $str(c,%itm3) $+ $str(d,%itm4) $+ $str(e,%itm5) $+ $str(f,%itm6) $+ $str(g,%itm7) $+ $str(h,%itm8) $+ $str(i,%itm9) $+ $str(j,%itm10) $+ $str(k,%itm11) $+ $str(l,%itm12)) ,$chr(32)),$rand(1,100),1)
        }
        if (%ltmp == 1 && %nick == sword[22]) {
          set %ltmp 2
          var %citem b
        }
        if (%citem == a) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 1000만원 증가!!!! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) + 10000000)) 따윈 훼이크고 현재 소지금의 10% 감소 ㅋㅋㅋㅋㅋ
          writeini -n tmp_exp.ini 돈 %nick $int($calc($readini(tmp_exp.ini,돈,%nick) * 0.9))
        }
        if (%citem == b) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 현재 소지금 맨 뒷자리 삭제! ㅋㅋㅋㅋ / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($int($calc($readini(tmp_exp.ini,돈,%nick) / 10)))
          write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 변경사항 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($int($calc($readini(tmp_exp.ini,돈,%nick) / 10))) / 사유 : 쿠폰 사용에 의한 뒷자리 삭제 / 쿠폰코드 : %citem / 설정확률 : $readini(percent.ini,쿠폰,2) $+ %
          writeini -n tmp_exp.ini 돈 %nick $int($calc($readini(tmp_exp.ini,돈,%nick) / 10))
        }
        if (%citem == c) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 현재 소지금 맨 뒷자리 0 하나 추가요~! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) * 10))
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) * 10)
        }
        if (%citem == d) {
          lsort
          set %lppl %nick
          var %prerank $ini(lrank.ini,돈,%lppl)
          var %nextrank $calc(%prerank - 1)
          if (%nextrank == 0) { var %nextrank $ini(lrank.ini,돈,0) }
          var %premoney $readini(lrank.ini,돈,%lppl)
          var %nextmoney $readini(lrank.ini,돈,$ini(lrank.ini,돈,%nextrank))
          privmsg $gettok(%Zodbot.data,3,32) 결과 :  $+ $nickdt(%nick) $+ 님의 바로 윗 순위인 $nickdt($ini(lrank.ini,돈,%nextrank)) $+ 님(순위 : %nextrank $+ 위)과의 재산 바꾸기가 이루어졌습니다. / 현재 소지금 : $comgen(%premoney) → $comgen(%nextmoney)
          writeini -n tmp_exp.ini 돈 %nick %nextmoney
          writeini -n tmp_exp.ini 돈 $ini(lrank.ini,돈,%nextrank) %premoney
          if (%prerank == 1) {
            sockwrite -tn Zodbot PRIVMSG $remove(%bot.autojoin,#프겔 $+ $chr(44)) : $+ [Zod 로또방송] [경] 현재 1위인 $nickdt(%nick) $+ 님이 꼴찌랑 재산을 바꾸는 바보짓을 하셨습니다! [축]
          }
          write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 변경사항 : $comgen(%premoney) → $comgen(%nextmoney) / 사유 : $ini(lrank.ini,돈,%nextrank) $+ 님과의 재산바꾸기 / 쿠폰코드 : %citem / 설정확률 : $readini(percent.ini,쿠폰,4) $+ %
        }
        if (%citem == e) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 10만원 증가! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) + 100000))
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + 100000)
        }
        if (%citem == f) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 50만원 증가! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) + 500000))
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + 500000)
        }
        if (%citem == g) {
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 500만원 증가! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) + 5000000))
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + 5000000)
        }
        if (%citem == h) {
          var %premoney $readini(tmp_exp.ini,돈,%nick)
          var %revmoney $int($calc(%premoney / 10))
          var %nextmoney $rand(1,9) $+ $reverse(%revmoney,%revmoney)
          privmsg $gettok(%Zodbot.data,3,32) 결과 : !로꾸거 의금지소 재현 는지머나 !게하덤랜 는리자첫 / 현재 소지금 : $comgen(%premoney) → $comgen(%nextmoney)
          writeini -n tmp_exp.ini 돈 %nick %nextmoney
        }
        if (%citem == i) {
          lsort
          set %lppl %nick
          var %victim $ini(lrank.ini,돈,$rand(1,$ini(lrank.ini,돈,0)))
          var %lsteal $rand(1,20)

          if (%ltmp3 == 1) {
            var %victim $ini(lrank.ini,돈,1)
            var %lsteal 20
            set %ltmp3 2
          }
          var %premoney $readini(tmp_exp.ini,돈,%nick)
          var %stealmoney $int($calc($readini(tmp_exp.ini,돈,%victim) * %lsteal / 100))
          var %nextmoney $calc(%premoney + %stealmoney)

          privmsg $gettok(%Zodbot.data,3,32) 결과 : 불우 이웃을 도웁시다. 그러니까 $nickdt(%victim) $+ 님 소지금에서 %lsteal $+ $chr(37) $+ ( $+ $comgen(%stealmoney) $+ )의 돈을 슬쩍... / 현재 소지금 : $comgen(%premoney) → $comgen(%nextmoney)
          write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 변경사항 : $comgen(%premoney) → $comgen(%nextmoney) / 사유 : %victim $+ 님 소지금에서 %lsteal $+ $chr(37) $+ ( $+ $comgen(%stealmoney) $+ )의 돈을 절도 / 쿠폰코드 : %citem / 설정확률 : $readini(percent.ini,쿠폰,9) $+ %
          writeini -n tmp_exp.ini 돈 %nick %nextmoney
          writeini -n tmp_exp.ini 돈 %victim $calc($readini(tmp_exp.ini,돈,%victim) - %stealmoney)

        }
        if (%citem == j) {
          var %lratio $rand(1,20)
          var %premoney $readini(tmp_exp.ini,돈,%nick)
          var %nextmoney $int($calc($readini(tmp_exp.ini,돈,%nick) * (1 + %lratio / 100)))
          privmsg $gettok(%Zodbot.data,3,32) 결과 : 현재 소지금의 %lratio $+ $chr(37) 증가!!! / 현재 소지금 : $comgen(%premoney) → $comgen(%nextmoney)
          writeini -n tmp_exp.ini 돈 %nick %nextmoney
        }
        if (%citem == k) {
          lsort
          set %lppl %nick
          var %prerank $ini(lrank.ini,돈,%lppl)
          var %nextrank $calc(%prerank + 1)
          if (%prerank == $ini(lrank.ini,돈,0)) { var %nextrank 1 }
          var %premoney $readini(lrank.ini,돈,%lppl)
          var %nextmoney $readini(lrank.ini,돈,$ini(lrank.ini,돈,%nextrank))
          privmsg $gettok(%Zodbot.data,3,32) 결과 :  $+ $nickdt(%nick) $+ 님의 바로 아랫 순위인 $nickdt($ini(lrank.ini,돈,%nextrank)) $+ 님(순위 : %nextrank $+ 위)과의 재산 바꾸기가 이루어졌습니다. / 현재 소지금 : $comgen(%premoney) → $comgen(%nextmoney)
          writeini -n tmp_exp.ini 돈 %nick %nextmoney
          writeini -n tmp_exp.ini 돈 $ini(lrank.ini,돈,%nextrank) %premoney
          if (%prerank == 1) {
            sockwrite -tn Zodbot PRIVMSG $remove(%bot.autojoin,#프겔 $+ $chr(44)) : $+ [Zod 로또방송] [경] 현재 1위인 $nickdt(%nick) $+ 님이 아랫순위와 재산을 바꾸는 바보짓을 하셨습니다! [축]
          }
          if (%prerank == $ini(lrank.ini,돈,0)) {
            sockwrite -tn Zodbot PRIVMSG $remove(%bot.autojoin,#프겔 $+ $chr(44)) : $+ [Zod 로또방송] [경] 현재 꼴찌였던 $nickdt(%nick) $+ 님이 아랫순위(=1위)와 재산을 바꾸는 혁명을 일으키셨습니다! [축]
          }
          write " $+ $logdirZod\cmdresult_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %nick $+ 님에 의한 " $+ $1- $+ " 명령. 변경사항 : $comgen(%premoney) → $comgen(%nextmoney) / 사유 : $ini(lrank.ini,돈,%nextrank) $+ 님과의 재산바꾸기 / 쿠폰코드 : %citem / 설정확률 : $readini(percent.ini,쿠폰,4) $+ %
        }        
        if (%citem == l) {
          var %randmoney $int($calc($readini(tmp_exp.ini,당첨,당첨금) / $rand(2,9999)))
          privmsg $gettok(%Zodbot.data,3,32) 결과 : $comgen(%randmoney) $+ 원 증가! / 현재 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) → $comgen($calc($readini(tmp_exp.ini,돈,%nick) + %randmoney))
          writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + %randmoney)
        }
      }
      remini -n tmp_exp.ini 쿠폰번호 $2
      remini -n tmp_exp.ini 쿠폰 $2
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 랭킹 || $1 == $readini(prefix.ini,%chan,p2) $+ 랭킹 || $1 == $readini(prefix.ini,%chan,p3) $+ 랭킹) {
      lsort    
      set %lppl $2      
      if (!$2) { set %lppl $ini(lrank.ini,돈,2) }
      if (!$readini(lrank.ini,돈,%lppl)) { privmsg $gettok(%Zodbot.data,3,32) $2 $+ 님의 정보는 DB에 존재하지 않는 것 같습니다. | halt }
      lrank
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 로또 || $1 == $readini(prefix.ini,%chan,p2) $+ 로또 || $1 == $readini(prefix.ini,%chan,p3) $+ 로또) {
      ; if (%chan != #Zod) { privmsg $gettok(%Zodbot.data,3,32) 이 기능은 너님들이 자꾸 싸워서 시범적으로 #Zod 채널에서만 운영합니다. | halt }
      if ($chr(91) isin %nick || $chr(93) isin %nick) { privmsg $gettok(%Zodbot.data,3,32) 현재 사용중이신 Nick에 $chr(91) 또는 $chr(93) 과 같은 문자가 포함되어 있으면 정상적인 동작을 보장하지 않습니다. Nick 변경 후 다시 시작해주세요. | halt }
      set %respawn_gold 200000
      if (!$readini(tmp_exp.ini,돈,%nick)) { writeini -n tmp_exp.ini 돈 %nick %respawn_gold }
      if ($readini(tmp_exp.ini,돈,%nick) < 10000) { privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님. 로또에 참가하려면 적어도 10,000원 이상 소지하고 있어야 가능합니다. 부족한 돈은 $replace($duration($timer(itmsply).secs),mins,분,secs,초,min,분,sec,초) 후에 다시 충전됩니다. (현재 소지금: $comgen($readini(tmp_exp.ini,돈,%nick)) $+ ) | halt }
      unset %lot_count
      if ($readini(tmp_exp.ini,당첨,당첨금) < 10000) { writeini -n tmp_exp.ini 당첨 당첨금 1000000000 }
      var %lotto $sorttok($urand(1,25,45,6),45,n)
      if (%lotto_bonus == 1 && %chan == #Zod) {
        var %lotto $readini(tmp_exp.ini,당첨,1등)
        set %lotto_bonus 2
      }
      if (%lotto_bonus == 3 && %nick == T10) {
        var %lotto 4-6-14-15-18-20
        set %lotto_bonus 2
      }
      var %minusgold 10000
      if ($readini(tmp_exp.ini,돈,%nick) > 100000000) { var %minusgold 1000000 | var %lbour 1 }
      if ($readini(tmp_exp.ini,돈,%nick) > 500000000) { var %minusgold 15000000 | var %lbour 2 }
      if ($readini(tmp_exp.ini,돈,%nick) > 500000000000) { var %minusgold 300000000 | var %lbour 3 }
      writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) - %minusgold)
      privmsg $gettok(%Zodbot.data,3,32) 현재 당첨금 :  $comgen( $+ $readini(tmp_exp.ini,당첨,당첨금) $+ )  $+ (1등 기준) / 당첨번호 :  $readini(tmp_exp.ini,당첨,1등) / 추첨된 번호 :  %lotto 
      if ($readini(tmp_exp.ini,당첨,당첨금) <= 10000000000000000) {
        writeini -n tmp_exp.ini 당첨 당첨금 $calc($readini(tmp_exp.ini,당첨,당첨금) + $rand(10000,999999) * $rand(1,50))
      }
      var %i 1
      var %j 1
      while (%i <= 6) {
        while (%j <= 6) {
          if ($gettok(%lotto,%i,45) == $gettok($readini(tmp_exp.ini,당첨,1등),%j,45)) {
            var %lot_suc %lot_suc $+ $chr(44) $+ $gettok(%lotto,%i,45)
            inc %lot_count
          }
          inc %j
        }
        var %j 1
        inc %i
      }
      if (%lot_count >= 4) {
        if (%lot_count == 4) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) / 30000)) }
        if (%lot_count == 5) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) * 0.1)) }
        if (%lot_count == 6) { var %lot_money $calc($readini(tmp_exp.ini,당첨,당첨금) * 1) }
        if (%lbour == 1) {
          if (%lot_count == 4) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) / 500)) }
          if (%lot_count == 5) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) * 0.5)) }
          if (%lot_count == 6) { var %lot_money $calc($readini(tmp_exp.ini,당첨,당첨금) * 2) }      
        }
        if (%lbour == 2) {
          if (%lot_count == 4) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) / 75)) }
          if (%lot_count == 5) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) * 0.8)) }
          if (%lot_count == 6) { var %lot_money $calc($readini(tmp_exp.ini,당첨,당첨금) * 6) }      
        }
        if (%lbour == 3) {
          if (%lot_count == 4) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) / 20)) }
          if (%lot_count == 5) { var %lot_money $int($calc($readini(tmp_exp.ini,당첨,당첨금) * 2)) }
          if (%lot_count == 6) { var %lot_money $calc($readini(tmp_exp.ini,당첨,당첨금) * 20) }      
        }
      }
      if (%lot_count <= 3) {
        if (%lot_count == 3) { var %lot_money 10000 }
        if (%lot_count == 2) { var %lot_money 5000 }
        if (%lot_count == 1) { var %lot_money 1000 }
        if (%lbour == 1) {
          if (%lot_count == 3) { var %lot_money 750000 }
          if (%lot_count == 2) { var %lot_money 300000 }
          if (%lot_count == 1) { var %lot_money 100000 }
        }
        if (%lbour == 2) {
          if (%lot_count == 3) { var %lot_money 7000000 }
          if (%lot_count == 2) { var %lot_money 4000000 }
          if (%lot_count == 1) { var %lot_money 1000000 }
        }
        if (%lbour == 3) {
          if (%lot_count == 3) { var %lot_money 100000000 }
          if (%lot_count == 2) { var %lot_money 50000000 }
          if (%lot_count == 1) { var %lot_money 10000000 }
        }
      }
      var %dice = $mid($remove($shuffle($str(o,$readini(percent.ini,로또,succ)) $+ $str(x,$readini(percent.ini,로또,fail))) ,$chr(32)),$rand(1,100),1)
      ; if (%nick == 하늘나무) { var %dice o }
      if ($readini(tmp_exp.ini,돈,%nick) < 1000000 && $rand(1,4) == 1) { var %dice o }
      if (%dice == o) { var %event1 $rand(2,9) }
      if (%dice == x) { var %event1 1 }
      if (%event1 != 1) { var %e_active 7(보너스! 상금 %event1 $+ 배 증가!) }
      var %profit $calc(%lot_money * %event1 - %minusgold)
      if (%profit < 0) { var %profit_stat 4( $+ $comgen($remove(%profit,-)) $+ 원 꼴았음 ㅋㅋㅋ $+ ) }
      if (%profit == 0) { var %profit_stat (본전치기) }
      if (%profit > 0) { var %profit_stat 12( $+ $comgen(%profit) $+ 원 이익! 슈ㅣ발 내가 꼴았음..ㅠㅠ $+ ) }
      if (%lot_count) {
        writeini -n tmp_exp.ini 돈 %nick $calc($readini(tmp_exp.ini,돈,%nick) + %lot_money * %event1)
        writeini -n tmp_exp.ini 당첨 당첨금 $calc($readini(tmp_exp.ini,당첨,당첨금) - %lot_money)      
        privmsg $gettok(%Zodbot.data,3,32) 맞춘갯수 :  %lot_count $+ 개 ( $+ $mid(%lot_suc,2) $+ ) / 당첨금액 : $comgen($calc(%lot_money * %event1)) $+ 원 %e_active %profit_stat 1/ 지출 후 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원 / 지난회( $+ $calc($readini(tmp_exp.ini,당첨,회차) - 1) $+ 회차) 당첨자 : $nickdt($readini(tmp_exp.ini,$calc($readini(tmp_exp.ini,당첨,회차) - 1),당첨자))
        if (%lot_count == 6) {
          var %max_bonus $readini(tmp_exp.ini,돈,%nick)
          privmsg $gettok(%Zodbot.data,3,32) 6개의 숫자를 다 맞추셨군요! 당신은 $readini(tmp_exp.ini,당첨,회차) $+ 회차 당첨자로 기록이 됩니다.
          sockwrite -tn Zodbot PRIVMSG $remove(%bot.autojoin,#프겔 $+ $chr(44)) : $+ [Zod 로또 방송] $nickdt(%nick) $+ 님이 $readini(tmp_exp.ini,당첨,회차) $+ 회차 로또 당첨자가 되었습니다!!
          writeini -n tmp_exp.ini $readini(tmp_exp.ini,당첨,회차) 당첨자 %nick
          writeini -n tmp_exp.ini 당첨 회차 $calc($readini(tmp_exp.ini,당첨,회차) + 1)
          writeini -n tmp_exp.ini 당첨 1등 $sorttok($urand(1,25,45,6),45,n)

          timerlotremove 5 1 lotremove
          remini -n tmp_exp.ini 쿠폰번호
          remini -n tmp_exp.ini 쿠폰

          writeini -n tmp_exp.ini 돈 %nick %max_bonus
          writeini -n tmp_exp.ini 당첨 당첨금 1000000000
          writeini -n tmp_exp.ini 돈 Xeriars 99999999999999999999999999999999999999999999999999999999999999999999999999999
        }
      }
      else { privmsg $gettok(%Zodbot.data,3,32) 한개도 맞추지 못하셨습니다! (づ `∀´)∠))) %profit_stat 1/ 지출 후 소지금 : $comgen($readini(tmp_exp.ini,돈,%nick)) $+ 원 / 지난회( $+ $calc($readini(tmp_exp.ini,당첨,회차) - 1) $+ 회차) 당첨자 : $nickdt($readini(tmp_exp.ini,$calc($readini(tmp_exp.ini,당첨,회차) - 1),당첨자)) }
      var %coupon $rand(1,10)
      if ($readini(tmp_exp.ini,돈,%nick) < 1000000) { var %coupon $rand(1,5) }
      if (%ltmp2 == 1 && %nick == 샤아) { var %coupon 1 | set %ltmp2 2 }
      if (%coupon == 1) {
        var %cobonus $rand(1,9)
        var %lot_time $readini(tmp_exp.ini,당첨,회차)
        if ($len(%lot_time) == 1) { var %lot_time $chr(48) $+ %lot_time }
        var %coupon_num $asctime(yyyy) $+ %lot_time $+ 11 $+ %cobonus
        var %lcoupon $gettok($gettok($amgine(%coupon_num),5,58),1,47)
        writeini -n tmp_exp.ini 쿠폰 %lcoupon %cobonus
        writeini -n tmp_exp.ini 쿠폰번호 %lcoupon %nick
        privmsg $gettok(%Zodbot.data,3,32) 쿠폰이 발급되었습니다! @쿠폰 %lcoupon $+ 을 입력하시면 사용이 가능합니다.
      }
      halt
    }
    ; $gettok(%Zodbot.data,1,32) 란 값은 주면 :Kage|설계님이 :Kage|설계!Kage$readini(prefix.ini,%chan,p1) $+ xeriars.users.HanIRC.org채널에서 11/28 18:06 에 호출하셨습니다. 로 인식됨
    ; 호출할때 $1 값인 $mid($gettok($gettok(%Zodbot.data,1,32),1,33),1) 는 $nick 을 의미한다.
    if ($1 == $readini(prefix.ini,%chan,p1) $+ Zod || $1 == $readini(prefix.ini,%chan,p2) $+ Zod || $1 == $readini(prefix.ini,%chan,p3) $+ Zod) {
      privmsg $gettok(%Zodbot.data,3,32) (||￣ㄷ￣)/~ 헉!!! 안녕하세요~ 전 전지전능하신 $me $+ 님에 의해 창조된 %botnick $+ 예요.. ( `∇´)∠)))
      privmsg $gettok(%Zodbot.data,3,32) Ver. 2.0 자세한건 “@ $+ 도움말” 을 참고하시고, $me $+ 님 호출은 “@ $+  $+ %esrever $+ ” 를 눌러주세요~
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+  $+ %esrever || $1 == $readini(prefix.ini,%chan,p2) $+  $+ %esrever || $1 == $readini(prefix.ini,%chan,p3) $+  $+ %esrever) {
      if ($readini(caction.ini,영구블랙,$address($mid($gettok($gettok(%Zodbot.data,1,32),1,33),2),2)) == 1) {
        halt
      }
      if (%caller == on) { 
        var %nick = $mid($gettok($gettok(%Zodbot.data,1,32),1,33),2), %chan = $mid($gettok($gettok(%Zodbot.data,3,32),1,33),1)
        set %climiter on
        if ($appactive == $false) {
          set -u3 %highlight_msg (||￣ㄷ￣)/~ 헉!!! 지금 주인님은 $read(bot.txt,s,status) $+ 중이신 관계로 IRC창을 보고 계시지 않습니다.
          set -u3 %highlight_msg2 주인님을 호출중이오니 잠시만 기다려주세요. 히힣~
          var %hmsg2 1
        }
        elseif ($active != %chan) {
          set -u3 %highlight_msg (||￣ㄷ￣)/~ 헉!!! 지금 주인님은 $masking($active) $+ 채널에서 노닥거리고 있습니다.
          set -u3 %highlight_msg2 주인님을 호출중이오니 잠시만 기다려주세요. 히힣~
          var %hmsg2 1
        }
        elseif ($active == %chan) {
          set -u3 %highlight_msg (||￣ㄷ￣)/~ 헉!!! 지금 주인님은 현재 채널을 보고계신것 같습니다만.. 
          set -u3 %highlight_msg2 호출요청을 하셨으니 일단 호출은 해볼께요. 잠시만 기다려주세요. 히힣~
          var %hmsg2 1
        }
        elseif ( $asc($left($active,1)) == 61 ) {
          set -u3 %highlight_msg (||￣ㄷ￣)/~ 헉!!! 지금 주인님은 DCC 중이십니다.
          set -u3 %highlight_msg2 주인님을 호출중이오니 잠시만 기다려주세요. 히힣~
          var %hmsg2 1
        }
        else {
          set -u3 %highlight_msg (||￣ㄷ￣)/~ 헉!!! 지금 주인님은 $read(bot.txt,s,status) $+ 중이십니다.
          set -u3 %highlight_msg2 주인님을 호출중이오니 잠시만 기다려주세요. 히힣~
          var %hmsg2 1
        }
        if (%ccalc == 1) { set -u3 %highlight_msg $nickdt(%nick) $+ 님 한번만 부르세요~! 주인님은 현재 $read(bot.txt,s,status) $+ 중 이신데 못 보실수도 있어요! | var %hmsg2 0 }
        elseif (%ccalc == 2) { set -u3 %highlight_msg $nickdt(%nick) $+ 님 한번씩만 부르세요!! 주인님은 현재 $read(bot.txt,s,status) $+ 중 이신 관계로 못 보실수도 있으니 조금만 더 기다려주세요. | var %hmsg2 0 }
        elseif (%ccalc >= 3) {
          privmsg $gettok(%Zodbot.data,3,32) ＼(*｀Д´)/ < 썅!! 고만 좀 부르라고!!!!
          privmsg $gettok(%Zodbot.data,3,32) $mid($gettok($gettok(%Zodbot.data,1,32),1,33),2) -> Ignored
          sockwrite -nt $sockname part $gettok(%Zodbot.data,3,32)
          sockwrite -nt $sockname notice $me : $+ 주인님 $mid($gettok($gettok(%Zodbot.data,3,32),1,33),1) $+ 채널에서 $mid($gettok($gettok(%Zodbot.data,1,32),1,33),2) $+ 님의 반복 호출 때문에 퇴장하였습니다.
          timer $+ $rand(1,99) 1 600 오토조인봇
          write black.txt $address($mid($gettok($gettok(%Zodbot.data,1,32),1,33),2),2)
          set %ccalc 0
          halt
        }
        privmsg $gettok(%Zodbot.data,3,32) %highlight_msg
        if (%hmsg2 == 1) {
          privmsg $gettok(%Zodbot.data,3,32) %highlight_msg2
        }
        privmsg $gettok(%Zodbot.data,3,32) 급하신게 아니라면 "@메모 할말"로 해주세요. 메모는 즉시 주인님께 전달됩니다. (ex : $readini(prefix.ini,%chan,p1) $+ 메모 잇힝~)
        splay "$mircdir\sounds\paging.wav" 
        inc %ccalc
        .sockwrite -nt $sockname notice $me : $+ %nick $+ 님이 %chan $+ 채널에서 $asctime(m/d HH:nn) 에 %ccalc $+ 번째 호출을 시도 하셨습니다.
        privmsg #bot-hq %nick $+ 님이 %chan $+ 채널에서 $asctime(m/d HH:nn) 에 %ccalc $+ 번째 호출을 시도 하셨습니다.
        .timer4 1 10 calllimiter
        .timer5 1 10 횟수계산
        halt
      }
      if (%caller == off) { 
        privmsg $gettok(%Zodbot.data,3,32) 현재 주인님께서는 $read(bot.txt,s,status) $+ 중이신 관계로 호출을 거부중이십니다.
        privmsg $gettok(%Zodbot.data,3,32) 급하신게 아니라면 " $+ $readini(prefix.ini,%chan,p1) $+ 메모 할말"로 해주세요. (ex: $readini(prefix.ini,%chan,p1) $+ 메모 하악하악~♡)
        halt
      }
      else {
        set %caller off
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 메모 || $1 == $readini(prefix.ini,%chan,p2) $+ 메모 || $1 == $readini(prefix.ini,%chan,p3) $+ 메모) {
      if (%caller == off) { privmsg $gettok(%Zodbot.data,3,32) 현재 주인님께서 메모 남기기를 거부하고 계십니다. | halt }
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 메모 할말”과 같은 형식으로 입력하여 주시기 바랍니다. | set %usagelimit 1 | halt }
      write memo.txt %chan $+ 채널에서 $asctime(m/d HH:nn) $+ 에 %nick $+ 님이 남기신 말 : $2-
      privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님은 " $+ $2- $+ " 와 같은 메모를 남기셨습니다.
      privmsg $gettok(%Zodbot.data,3,32) 메모는 즉시 현재 $read(bot.txt,s,status) $+ 중 이신 주인님께로( $+ $me $+ ) 전송될 것 입니다.
      sockwrite -nt $sockname notice $me : $+ %nick $+ 님이 %chan $+ 채널에서 $asctime(m/d HH:nn) 에 메모를 남기셨습니다. "@메모확인"으로 확인해주세요.
      privmsg #bot-hq %nick $+ 님이 %chan $+ 채널에서 $asctime(m/d HH:nn) 에 메모를 남기셨습니다. "@메모확인"으로 확인해주세요.
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 업타임 || $1 == $readini(prefix.ini,%chan,p2) $+ 업타임 || $1 == $readini(prefix.ini,%chan,p3) $+ 업타임) { privmsg $gettok(%Zodbot.data,3,32) Zod의 부팅후 현재까지 가동시간은 : $replace($duration($calc($ticks / 1000)), wks, 주, wk, 주, days, 일, day, 일, hrs, 시간, hr, 시간, mins, 분, min, 분, secs, 초, sec, 초) | halt }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 격언 || $1 == $readini(prefix.ini,%chan,p2) $+ 격언 || $1 == $readini(prefix.ini,%chan,p3) $+ 격언) { privmsg $gettok(%Zodbot.data,3,32) $read(격언.txt) | halt }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 이모티콘 || $1 == $readini(prefix.ini,%chan,p2) $+ 이모티콘 || $1 == $readini(prefix.ini,%chan,p3) $+ 이모티콘) { privmsg $gettok(%Zodbot.data,3,32) $read(표정.txt) | halt }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 타롯 || $1 == $readini(prefix.ini,%chan,p2) $+ 타롯 || $1 == $readini(prefix.ini,%chan,p3) $+ 타롯) {
      if (($2 == $me) || ($2 == %botnick) || (%esrever isin $2-)) { privmsg $gettok(%Zodbot.data,3,32) 검색이 불가능한 질문입니다. | halt }
      if ($2) {
        privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님이 요청하신 " $+ $2- $+ " 은(는) 아래와 같습니다.
      }
      var %tarot $rand(1,46)
      var %i 0
      while (%i < 2) {
        inc %i
        if (%i == 1) { privmsg $gettok(%Zodbot.data,3,32) 뽑은 카드 : 6 $+ $readini(tarot.ini,%tarot,%i) }
        if (%i == 2) { privmsg $gettok(%Zodbot.data,3,32) $readini(tarot.ini,%tarot,%i) }
      }
      halt
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 오미쿠지 || $1 == $readini(prefix.ini,%chan,p2) $+ 오미쿠지 || $1 == $readini(prefix.ini,%chan,p3) $+ 오미쿠지) {
      var %omikuzi $rand(1,10)
      privmsg $gettok(%Zodbot.data,3,32)  $+ $+ $read(형용사.txt) $nickdt(%nick) $+ 님이 뽑은 제비 : 6 $+ $readini(omikuzi.ini,%omikuzi,1)
      privmsg $gettok(%Zodbot.data,3,32) $readini(omikuzi.ini,%omikuzi,2)
      halt
    }    
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 옵내놔 || $1 == $readini(prefix.ini,%chan,p2) $+ 옵내놔 || $1 == $readini(prefix.ini,%chan,p3) $+ 옵내놔) { 
      if (%nick isop %chan) {
        privmsg $gettok(%Zodbot.data,3,32) 이미 옵이 있잖수? -_-;
        halt
      }
      if (%botnick isop %chan) {
        if (%nick !isop %chan) {
          var %i 1
          while (%i <= $lines(iplist.txt)) {
            if ($address(%nick,2) iswm $read(iplist.txt,%i)) {
              privmsg $gettok(%Zodbot.data,3,32) 드..드리겠습니다!
              sockwrite -tn Zodbot mode %chan +ov %nick %nick
              halt
            }
            if ($address(%nick,2) !iswm $read(iplist.txt,%i)) {
              privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님은 옵을 받도록 설정된 사용자가 아닙니다.
              halt
            }
            inc %i
          }
        }
      }
      if (%botnick !isop %chan) {
        privmsg $gettok(%Zodbot.data,3,32) $nickdt(%nick) $+ 님 지금 %chan 채널에 옵을 가지고 있지 않은데요? -_-;;
        halt
      }
    }
    if ($1 == $readini(prefix.ini,%chan,p1) $+ 한자 || $1 == $readini(prefix.ini,%chan,p2) $+ 한자 || $1 == $readini(prefix.ini,%chan,p3) $+ 한자) {
      if (!$2) { privmsg $gettok(%Zodbot.data,3,32) “@ $+ 한자 漢文”과 같은 형식으로 입력하셔야 합니다. | set %usagelimit 1 | halt }
      if ($len($2) >= 500) { privmsg $gettok(%Zodbot.data,3,32) 너무 무리하는거 아냐? | set %usagelimit 1 | halt }
      var %inputhk $2
      if ($3-) { privmsg $gettok(%Zodbot.data,3,32) 띄어쓰기 및 특수문자는 허용하지 않습니다. | set %usagelimit 1 | halt }
      var %i 0
      while (%i <= 128) {
        inc %i
        var %inputhk $remove(%inputhk,$chr(%i))
      }
      var %j 1
      while (%j <= $len(%inputhk)) {
        var %result %result $+ $readini(hkdb.ini,convert,$mid(%inputhk,%j,2))
        var %j $calc(%j + 2)
      }
      privmsg $gettok(%Zodbot.data,3,32) 요청하신 한자 " $+ %inputhk $+ " $+ 의 독음은 " $+ %result  $+ "1입니다.
      halt
    }
    ;공용 스크립트의 끝
  }
  else {
    halt
  }
}
; @엉터리단어 관련 소켓
on *:sockopen:junktoy*: {
  sockwrite -nt $sockname GET /cgi/toy-acronymer.cgi?acronym= $+ %jscript.word HTTP/1.1
  sockwrite -nt $sockname User-Agent: Zod Web Client
  sockwrite -nt $sockname Host: brunching.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:junktoy: {
  sockread %tmp
  if (%jscript.temp == 1) {
    timeoutoff
    set %jscript.result %tmp
    unset %jscript.temp
    if (%jscript.error1 == %jscript.result) { privmsg %jscript.chan  Y2K 버그를 일으키고 싶지 않거든, 영어로만 입력하세요. | halt }
    if (%jscript.error2 == %jscript.result) { privmsg %jscript.chan  단어는 2~6글자만 가능합니다. 다시 시도해주세요. | halt }
    privmsg %jscript.chan  %jscript.word :  $+ %jscript.result
    unset %jscript.*
    halt
  }
  if (<P><BIG><B> isin %tmp) {
    set %jscript.temp 1
  }
}
on *:sockopen:youtube*: {
  sockwrite -nt $sockname GET /results?search_type=&search_query= $+ %youtube.url $+ &aq=f HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: www.youtube.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:youtube: {
  sockread %tmp
  set %youtube.search0 약 <strong>
  set %youtube.search0 $dll(utf8.dll,convertutf8,%youtube.search0)
  set %youtube.search1 <div class="v120WideEntry"><div class="v120WrapperOuter">
  set %youtube.search2 class="video-description">
  set %youtube.search3 <button class="master-sprite ratingVS ratingVS-
  set %youtube.search4 class="video-date-added">
  set %youtube.search5 class="video-view-count">
  set %youtube.search6 <span class="video-username">
  set %youtube.error <div style="margin-top: 10px"><span
  set %youtube.error2 icn_cycds_warning-vfl33982.gif

  if (%youtube.count == 2) {
    set %youtube.describe $dll(utf8.dll,convertlocal,$replace($remove(%tmp,$chr(9)),<b>,,</b>,))
    set %youtube.count 1
  }

  if (%youtube.error isin %tmp) {
    timeoutoff
    privmsg %youtube.chan " $+ %youtube.word $+ " 의 검색결과가 존재하지 않습니다.
    sockclose $sockname
    unset %youtube.*  
  }
  if (%youtube.error2 isin %tmp) {
    timeoutoff
    privmsg %youtube.chan " $+ %youtube.word $+ " 의 검색결과가 존재하지 않습니다.
    sockclose $sockname
    unset %youtube.*  
  }
  if (%youtube.search0 isin %tmp) {
    set %youtube.amount $remove($gettok(%tmp,1,47),%youtube.search0,<,$chr(9))
  }
  if (%youtube.search1 isin %tmp) {
    set %youtube.id $remove($gettok(%tmp,8,34),$chr(9),video-url-)
    set %youtube.video http://www.youtube.com/watch?v= $+ %youtube.id
    set %youtube.subject $dll(utf8.dll,convertlocal,$remove($gettok(%tmp,16,34),$chr(9)))
  }
  if (%youtube.search3 isin %tmp) { set %youtube.ratio $gettok(%tmp,4,34) $+ 점 }
  if (%youtube.search4 isin %tmp) { set %youtube.added $dll(utf8.dll,convertlocal,$remove($gettok(%tmp,5,34),</span>,>)) }
  if (%youtube.search5 isin %tmp) { set %youtube.vcount $remove($dll(utf8.dll,convertlocal,$remove($gettok(%tmp,5,34),</span>,>)),조회,수,$chr(32)) }
  if (%youtube.search6 isin %tmp) { set %youtube.user $remove($gettok(%tmp,9,34),</a>,</span>,>) | set %youtube.count 77 }  
  if (%youtube.count == 77) {
    if (!%youtube.ratio) { set %youtube.ratio 평점없음 }
    timeoutoff
    privmsg %youtube.chan $chr(91) $+ %youtube.subject $+ $chr(93) - %youtube.video  ( $+ 약 %youtube.amount $+ 개의 동영상 검색)
    privmsg %youtube.chan 설명 : %youtube.describe / 등록일 : %youtube.added / 평점 : %youtube.ratio / 조회 수 : %youtube.vcount / 등록자 : %youtube.user
    sockwrite -nt Zodbot notice %youtube.nick : $+ 더 많은 결과를 보시려면 http://www.youtube.com/results?search_type=&search_query= $+ %youtube.url $+ &aq=f 를 참조하십시요.
    sockclose $sockname
    unset %youtube.*
  }

  if (%youtube.search2 isin %tmp) { set %youtube.count 2 }
}
on *:sockopen:clubbox*: {
  sockwrite -nt $sockname GET /search.php?qstr= $+ $urlencode(%clubbox.word) HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: boxfile.co.kr
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:clubbox: {
  sockread %tmp
  set %clubbox.search1 </font>]개의 정보를 찾았습니다. </b></td>
  set %clubbox.sresult <li><div class='listfname'>
  set %clubbox.error <b>검색 결과가 없습니다.
  set %clubbox.error2 <td bgcolor=#f1f1f1 align=center><font color=white><a href="javascript:history.back(-1)">
  set %clubbox.end <table whith=860 border=0>
  set %clubbox.title filedownload><font color='#999999'>

  if (%clubbox.title isin %tmp && %clubbox.cnt == 1) { set %clubbox.title2 $remove($gettok(%tmp,5,62),</font) | set %clubbox.cnt 2 }

  if (%clubbox.search1 isin %tmp) { set %clubbox.result1 $remove($gettok(%tmp,7,62),</font)  }
  if (%clubbox.end isin %tmp) { set %clubbox.count 100 }

  if (%clubbox.error isin %tmp) { set %clubbox.count 44 }
  if (%clubbox.error2 isin %tmp) { set %clubbox.count 44 }
  if (%clubbox.sresult isin %tmp && %clubbox.limit == 1) { set %clubbox.limit 2 | set %clubbox.result4 $remove(%tmp,%clubbox.sresult,<img src='/images2/greenfile.gif'> <font color='gray'>,<b>,$chr(9),</b>,</font> </div>,</li>,</div>) }

  if (%clubbox.count == 44) {
    timeoutoff
    privmsg %clubbox.chan 요청하신 검색어 %clubbox.word $+ 의 결과를 찾을 수 없습니다.
    sockclose $sockname
    unset %clubbox.*
  }
  if (%clubbox.count == 100) {
    timeoutoff
    privmsg %clubbox.chan 검색어 : $remove(%clubbox.word,$chr(38)) (총 $comgen(%clubbox.result1) $+ 건)  / 첫번째 검색파일 : %clubbox.result4 - %clubbox.title2
    privmsg %clubbox.chan 검색결과 URL : http://boxfile.co.kr/search.php?qstr= $+ $urlencode(%clubbox.word)
    sockclose $sockname
    unset %clubbox.*
  }
}
on *:sockopen:djmax: {
  sockwrite -nt $sockname GET /portable/ $+ %djmax.bsce $+ Rank.asp? $+ %djmax.key $+ &page= $+ %djmax.page HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: www.platinumcrew.co.kr
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:djmax: {
  sockread %tmp
  set %djmax.word1 <td class="b12" style="padding:3 0 0 4">
  set %djmax.end <td>&nbsp;</td>
  set %djmax.rank <td width="60" align="center" class="b12">
  set %djmax.class <td width="50"><img src="http://promo.platinumcrew.co.kr/icon/
  set %djmax.score <td width="110" align="center" class="b12">  
  if (%djmax.key == mode=0) {
    set %djmax.score <td width="270" align="center" class="b12">
  }
  set %djmax.date <td width="120" align="center" class="g12">
  set %djmax.music <td><img src="http://promo.platinumcrew.co.kr/icon/

  if (%djmax.rank isin %tmp) { set %djmax.result1 $remove(%tmp,%djmax.rank,</td>,$chr(9)) }
  if (%djmax.word1 isin %tmp) {
    if ($remove(%tmp,%djmax.word1,</td>,$chr(9),$chr(32)) == %djmax.id) { set %djmax.EN 1 }
  }
  if (%djmax.end isin %tmp) {
    if (%djmax.page >= 10) {
      timeoutoff
      privmsg %djmax.chan 해당 DJ를 찾을 수 없습니다. (DJ검색은 1~100위 까지만 제공됩니다.)
      unset %djmax.*
      sockclose $sockname
    }
    else {
      inc %djmax.page
      sockclose $sockname
      sockopen djmax www.platinumcrew.co.kr 80
      timeout 5 %djmax.chan djmax
    }
  }
  if (%djmax.EN == 1) {
    if (%djmax.class isin %tmp) {
      if (%djmax.dj2 == bs) {
        set %djmax.result2 $remove(%tmp,%djmax.class,pspbs/level/djclass_,.jpg"></td>,$chr(9))
        set %djmax.result2 $replace(%djmax.result2,00,Beginner,01,Guest DJ,02,Street DJ,03,Pro DJ,04,Master DJ,05,DJ MAX Grand Master,06,Beat Maestro,07,THE DJ MAX)
      }
      if (%djmax.dj2 == ce) {
        set %djmax.result2 $remove(%tmp,%djmax.class,pspce/level/djclass_,.jpg"></td>,$chr(9))
        set %djmax.result2 $replace(%djmax.result2,00,Beginner,01,Guest DJ,02,Street DJ,03,Pro DJ,04,Master DJ,05,DJ MAX Grand Master,06,Beat Maestro,07,THE DJ MAX)
      }
    }
    if (%djmax.music isin %tmp) { 
      if (%djmax.dj2 == bs) {
        set %djmax.tmp %djmax.result3
        set %djmax.result3 $remove(%tmp,%djmax.music,pspbs/music/,.png" class="png24"></td>,$chr(9))
        set %djmax.result3 $replace(%djmax.result3,00_0,고백 $+ $chr(44) $+ 꽃 $+ $chr(44) $+ 늑대 part2,01_0,Desperado,02_0,Sweet Shining Shooting Star,02_1,Sweet Shining Shooting Star 4Hard,03_0,Fermion,03_1,Fermion 4Hard,03_2,Fermion 12MX,04_0,Fury,04_1,Fury 4Hard,05_0,Get Down,06_0,Landscape,06_1,Landscape 4Hard)
        set %djmax.result3 $replace(%djmax.result3,07_0,Colours of Sorrow,07_1,Colours of Sorrow 4Hard,08_0,Grave Consequence,08_1,Grave Consequence 4Hard,08_2,Grave Consequence 12MX,09_0,Heart of Witch,09_1,Heart of Witch 4Hard,09_2,Heart of Witch 12MX,10_0,I Want You,10_1,I Want You 4Hard)
        set %djmax.result3 $replace(%djmax.result3,10_3,I Want You 3RD,11_0,Remember,11_1,Remember 4Hard,12_0,In My Dream,12_1,In My Dream 4Hard,12_2,In My Dream 12MX,13_0,Jealousy,14_0,STOP,14_1,STOP 4Hard,15_0,Lovely Hands,15_1,Lovely Hands 4Hard,16_0,Keys to the World,16_1,Keys to the World 4Hard)
        set %djmax.result3 $replace(%djmax.result3,17_0,Melody,17_1,Melody 4Hard,18_0,Play the FUTURE,18_1,Play the FUTURE 4Hard,19_0,Ready Now,19_1,Ready Now,20_0,Ruti $+ $chr(39) $+ n,20_1,Ruti $+ $chr(39) $+ n,21_0,Secret World,21_1,Secret World 4Hard,22_0,Son of Sun,22_1,Son of Sun 4Hard,22_2,Son of Sun 12MX)
        set %djmax.result3 $replace(%djmax.result3,23_0,Dear my Lady,23_1,Dear my Lady 4Hard,24_0,Fever Pitch Girl,25_0,PDM,25_1,PDM 4Hard,26_0,The Last Dance,26_1,The Last Dance 4Hard,27_0,SuperSonic,27_1,SuperSonic 4Hard,28_0,DJMAX,28_1,DJMAX 4Hard,29_0,Honeymoon,29_1,Honeymoon 4Hard,29_3,Honeymoon 3RD)
        set %djmax.result3 $replace(%djmax.result3,30_0,Lover,30_3,Lover 3RD,31_0,Y,31_1,Y 4Hard,31_3,Y 3RD,32_0,Shoreline,32_1,Shoreline 4Hard,32_2,Shoreline 12MX,32_3,Shoreline 3RD,33_0,Cypher Gate,33_1,Cypher Gate 4Hard,33_3,Cyper Gate 3RD,34_0,Voyage,35_0,Beat U Down,35_2,Beat U Down 12MX)
        set %djmax.result3 $replace(%djmax.result3,36_0,바람에게 부탁해 Live Mix,37_0,River Flow,38_0,Get Up,38_1,Get Up,39_0,Relation Again,39_3,Relation Again 3RD,40_0,YO MAX,40_1,YO MAX 4Hard,41_0,Super Lovely,41_1,Super Lovely 4Hard,41_2,Super Lovely 12MX,42_0,Real Over DRIVE,42_1,Real Over DRIVE 4Hard,43_0,HAMSIN,43_1,HAMSIN 4Hard)
        set %djmax.result3 $replace(%djmax.result3,44_0,DIVINE SERVICE,44_1,DIVINE SERVICE 4Hard,45_0,Higher,45_1,Higher 4Hard,46_0,Space of Soul,46_1,Space of Soul 4Hard,47_0,Nightmare,47_1,Nightmare 4Hard)
        set %djmax.result3 %djmax.tmp $+ 1 $+ $chr(44) %djmax.result3 $+ 1
      }
      if (%djmax.dj2 == ce) {
        set %djmax.tmp %djmax.result3
        set %djmax.result3 $remove(%tmp,%djmax.music,pspce/music/,.png" class="png24"></td>,$chr(9))
        set %djmax.result3 $replace(%djmax.result3,00_0,내게로 와,00_1,내게로 와 4Hard,01_0,The Night Stage,01_1,The Night Stage 4Hard,02_0,Color,02_1,Color 4Hard,03_0,Creator,03_1,Creator 4Hard,04_0,Flea,04_1,Flea 4Hard,05_0,Freedom,05_1,Freedom,06_0,Electronics,06_1,Electronics 4Hard,07_0,Love mode,07_1,Love mode 4Hard)
        set %djmax.result3 $replace(%djmax.result3,08_0,무투,08_1,무투,09_0,영원,09_1,영원 4Hard,10_0,처음만 힘들지,10_1,처음만 힘들지 4Hard,11_0,No Way,11_1,No Way 4Hard,12_0,CLOSER,12_1,CLOSER 4Hard,13_0,Coastal Tempo,13_1,Coastal Tempo 4Hard,14_0,First Kiss,14_1,First Kiss 4Hard,15_0,너에게,15_1,너에게 4Hard,16_0,Motion,16_1,Motion 4Hard))
        set %djmax.result3 $replace(%djmax.result3,17_0,Touch my body,17_1,Touch my body 4Hard,18_0,Tell me,18_1,Tell me 4Hard,19_0,Urban Night,19_1,Urban Night 4Hard,20_0,고백 $+ $chr(44) $+ 꽃 $+ $chr(44) $+ 늑대,20_1,고백 $+ $chr(44) $+ 꽃 $+ $chr(44) $+ 늑대 4Hard,21_0,in my heart,21_1,in my heart 4Hard,22_0,The Clear Blue Sky,22_1,The Clear Blue Sky 4Hard)
        set %djmax.result3 $replace(%djmax.result3,23_0,I want You,23_1,I wan You,24_0,JBG,24_1,JBG 4Hard,25_0,Melody,25_1,Melody 4Hard,26_0,Here in the Moment,26_1,Here in the Moment 4Hard,27_0,The Last Dance,27_1,The Last Dance 4Hard,28_0,Supersonic,28_1,Supersonic 4Hard,29_0,DJMAX,29_1,DJMAX 4Hard,30_0,Honeymoon,30_1,Honeymoon 4Hard)
        set %djmax.result3 $replace(%djmax.result3,31_0,DARK ENVY KNIGHT,31_1,DARK ENVY KNIGHT 4Hard,32_0,Lover,32_1,Lover 4Hard,33_0,Y,33_1,Y 4Hard,34_0,YOUR OWN MIRACLE,34_1,YOUR OWN MIRACLE 4Hard,35_0,Blythe,35_1,Blythe 4Hard,36_0,OBLIVION,36_1,OBLIVION 4Hard,37_0,SIN,37_1,SIN 4Hard,38_0,아침형 인간,38_1,아침형 인간 4Hard)
        set %djmax.result3 $replace(%djmax.result3,39_0,Memory of Beach,39_1,Memory of Beatch 4Hard,40_0,Sunny Side,40_1,Sunny Side 4Hard,41_0,태권부리,41_1,태권부리 4Hard,42_0,Elastic Star ~UK Garage Mix~,42_1,Elastic Star ~UK Garage Mix~ 4Hard,43_0,Syriana,43_1,Syriana 4Hard,44_0,바람에게 부탁해,44_1,바람에게 부탁해 4Hard)
        set %djmax.result3 $replace(%djmax.result3,45_0,Fate,45_1,Fate 4Hard,46_0,Play the FUTURE,46_1,Play the FUTURE 4Hard,47_0,Landscape,47_1,Landscape 4Hard)
        set %djmax.result3 %djmax.tmp $+ 1 $+ $chr(44) %djmax.result3 $+ 1
      }
    }
    if (%djmax.score isin %tmp) { set %djmax.result4 $remove(%tmp,%djmax.score,</td>,$chr(9)) }
    if (%djmax.date isin %tmp) { set %djmax.result5 $remove(%tmp,%djmax.date,</td>,$chr(9)) | set %djmax.count 1 }
  }
  if (%djmax.count == 1) {
    timeoutoff
    privmsg %djmax.chan 구분 : DJ MAX %djmax.dj / 순위 : %djmax.result1 / DJ : %djmax.id / 계급 : %djmax.result2 
    if (%djmax.key == mode=0) {
      privmsg %djmax.chan 하이콤보 : %djmax.result4 / 등록일 : %djmax.result5
    }
    else {
      privmsg %djmax.chan 플레이곡 : $mid(%djmax.result3,4) / 점수 : %djmax.result4 / 등록일 : %djmax.result5
    }
    unset %djmax.*
    sockclose $sockname
  }
}
on *:sockopen:wowach: {
  sockwrite -nt $sockname GET /character-achievements.xml?r= $+ %wow.serv2 $+ &cn= $+ %wow.id2 HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: kr.wowarmory.com
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname $crlf
}
on *:sockread:wowach: {
  sockread %tmp
  ; echo -a %tmp
  set %wow.prog <div class="prog_int_text">
  set %wow.timestamp <div class="s_ach_stat">
  set %wow.achv <span class="achv_desc">
  set %wow.end <div class="data-shadow-bot">

  if (%wow.prog isin %tmp && %wow.cnt2 == 1) { set %wow.ach $dll(utf8.dll,convertlocal,$remove(%tmp,%wow.prog)) | set %wow.cnt2 2 }
  if (%wow.cnt == 7) { set %wow.time $remove(%tmp,$chr(9)) | set %wow.cnt 1 }
  if (%wow.timestamp isin %tmp) { set %wow.cnt 7 }
  if (%wow.achv isin %tmp ) {
    set %wow.ach $remove(%wow.ach,총 완료,%wow.prog,</div>,:,$chr(32))
    set %wow.desc $dll(utf8.dll,convertlocal,$replace(%tmp,<span>,[,</span>,],%wow.achv,$chr(32) $+ $chr(45) $+ $chr(32)))
    sockclose $sockname
  }
}
on *:sockopen:wow: {
  sockwrite -nt $sockname GET /character-sheet.xml?r= $+ %wow.serv2 $+ &n= $+ %wow.id2 HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: kr.wowarmory.com
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname $crlf
}
on *:sockread:wow: {
  sockread %tmp
  ; echo -a %tmp
  set %wow.wordx <a href="/character-achievements.xml
  set %wow.word0 <a class="staticTip" href="/character-sheet.xml
  set %wow.word1 <span class="prefix">
  set %wow.word2 <a href="/guild-info.xml
  set %wow.word3 <div class="health_stat">
  set %wow.word4 <div class="secondary_stat">
  set %wow.word5 class="talent_name">
  set %wow.word6 <div class="prof_name">
  set %wow.word9 <div class="last_modified">
  set %wow.end <div class="data-shadow-bot">
  set %wow.error <str id="armory.labels.nocharacter">
  set %wow.error2 <body class="errorpage">
  set %wow.itm <td class="glist_icon">

  if (%wow.count == 4) { set %wow.mp $dll(utf8.dll,convertlocal,$remove(%tmp,<em>,</em>,<div class="mana-stat">,<div class="rage">,<div class="energy">,<div class="runic">,기력,룬 마력:)) | set %wow.count 1 }
  if (%wow.count == 61) { set %wow.prof %wow.prof $remove(%tmp,<div class="prof_value">,</div>) | set %wow.count 1 }
  if (%wow.count == 6) { set %wow.prof %wow.prof $+ $chr(44) $remove(%tmp,<div>,</div>) | set %wow.count 61 }
  if (%wow.wordx isin %tmp) { set %wow.achp $remove($gettok(%tmp,2,62),</a) }
  if (%wow.word0 isin %tmp) { set %wow.char $dll(utf8.dll,convertlocal,$replace($gettok(%tmp,2,39),&nbsp;,$chr(32))) }
  if (%wow.word1 isin %tmp) { set %wow.prefix $dll(utf8.dll,convertlocal,$remove(%tmp,<span class="prefix">,&nbsp;)) }
  if (%wow.word2 isin %tmp) { set %wow.gn $dll(utf8.dll,convertlocal,$remove($gettok(%tmp,2,62),</a)) }
  if (%wow.word3 isin %tmp) { set %wow.hp $dll(utf8.dll,convertlocal,$remove(%tmp,%wow.word3,<em>,</em>)) }
  if (%wow.word4 isin %tmp) { set %wow.count 4 }
  if (%wow.word5 isin %tmp) {
    ; echo -a %tmp
    set %wow.ta1 $remove($gettok(%tmp,6,62),<span class="talent_value")
    set %wow.ta2 $remove($gettok(%tmp,15,62),<span class="talent_value")
    if (!%wow.ta1) { set %wow.ta1 $dll(utf8.dll,convertutf8,없음) }
    if (!%wow.ta2) { set %wow.ta2 $dll(utf8.dll,convertutf8,없음) }
    set %wow.talent %wow.ta1 $remove($gettok(%tmp,7,62),</span) $+ $chr(44) %wow.ta2 $remove($gettok(%tmp,16,62),</span)
    set %wow.talent $dll(utf8.dll,convertlocal,%wow.talent)
  }
  if (%wow.word6 isin %tmp) { set %wow.count 6 }

  if (%wow.word9 isin %tmp) { set %wow.update $dll(utf8.dll,convertlocal,$remove(%tmp,%wow.word9,&nbsp;,</div>)) }

  if (%wow.itm isin %tmp && %wow.itmc <= 15) {
    set %wow.tmp $dll(utf8.dll,convertlocal,$remove($gettok(%tmp,9,62),</span))
    set %wow.inv %wow.inv $+ $chr(44) %wow.tmp
    if (%wow.tmp != 羲羲) { inc %wow.itmc }
  }
  if (%wow.end isin %tmp) {
    timeoutoff
    sockclose $sockname    
    sockclose wowach
    sockopen wowach kr.wowarmory.com 80
    timerwowr 1 2 wowcommand
    halt
  }
  if (%wow.error isin %tmp || %wow.error2 isin %tmp) {
    timeoutoff
    privmsg %wow.chan 존재하지 않는 캐릭터이거나 캐릭터 이전, 유료 캐릭터명 변경 서비스 이용으로 인해 일시적으로 검색이 되지 않는 캐릭터입니다.
    privmsg %wow.chan 캐릭터 이름을 바르게 입력하셨는지 확인하시기 바랍니다. 삭제된 캐릭터는 전투정보실에서 검색할 수 없습니다.
    sockclose $sockname
    ; unset %wow.*
    halt    
  }
}
on *:sockopen:redtube*: {
  sockwrite -nt $sockname GET /?search= $+ %redtube.id HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: www.redtube.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:redtube: {
  sockread %tmp
  set %redtube.word0 <span class="numberOfVideos">  
  set %redtube.word1 <div class="video">
  set %redtube.word2 <span class="d">
  set %redtube.word3 <div style="float:right;">
  set %redtube.error <h1 class="categoryHeading" id="noVideos">

  if (%redtube.count == 2) {
    set %redtube.vid http://www.redtube.com/ $+ $remove($gettok(%tmp,2,34),$chr(47),$chr(9))
    set %redtube.describe $remove($gettok(%tmp,4,34),$chr(9))
    set %redtube.count 1
  }
  if (%redtube.word0 isin %tmp) {
    set %redtube.amount $gettok(%tmp,6,32)
  }
  if (%redtube.word1 isin %tmp) {
    set %redtube.count 2
  }
  if (%redtube.word2 isin %tmp) {
    set %redtube.time $remove(%tmp,%redtube.word2,</span>,$chr(9))
  }
  if (%redtube.word3 isin %tmp) {
    set %redtube.grade $remove(%tmp,%redtube.word3,</div>,$chr(9))
    set %redtube.count 100
  }
  if (%redtube.error isin %tmp) {
    timeoutoff
    privmsg %redtube.chan [4!1] 해당 검색어에 관한 내용을 찾을 수 없습니다. 검색어는 영어만 지원합니다.
    sockclose $sockname
    unset %redtube.*
  }  

  if (%redtube.count == 100) {
    timeoutoff
    if (%redtube.caller == $me) {
      privmsg %redtube.chan $chr(91) $+ %redtube.describe $+ $chr(93) - %redtube.vid (약 $comgen(%redtube.amount) $+ 건의 야동 검색) / 등급 : %redtube.grade / 플레이타임 : %redtube.time
    }
    else {
      sockwrite -nt Zodbot notice %redtube.caller : $+ $chr(91) $+ %redtube.describe $+ $chr(93) - %redtube.vid (약 $comgen(%redtube.amount) $+ 건의 야동 검색) / 등급 : %redtube.grade / 플레이타임 : %redtube.time
      privmsg %redtube.chan 검색결과를 notice로 출력하였습니다.
    }
    sockwrite -nt Zodbot notice %redtube.caller : $+ 검색된 리스트는 http://www.redtube.com/?search= $+ %redtube.id 에서 보실 수 있습니다.
    sockclose $sockname
    unset %redtube.*
  }
}
on *:sockopen:sattack: {
  sockwrite -nt $sockname GET /Ranking/Total/ninc_Search.asp?id=&pagegu=index&Condition=2&p_userid= $+ $urlencode(%sda.id) HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: suddenattack.netmarble.net
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname Accept: */*
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname $crlf
}
on *:sockread:sattack: {
  sockread %tmp
  set %sda.word <td colspan="5" style="color:#82A3A3"><a href="javascript:GetSaInfo_new
  set %sda.word2 <td width="122" style="color:#82A3A3">
  set %sda.word3 <td width="89">
  set %sda.word4 <td width="184">
  set %sda.remove $eval(%2Franking%2FPopUp%2FSaGameInfo%2Easp%3FUserID=,0)
  set %sda.error private_nosearch01.gif

  if (%sda.word isin %tmp) { set %sda.userid $remove($gettok($replace(%tmp,$eval(%3d,0),=),2,39),%sda.remove) }
  if (%sda.word2 isin %tmp) {
    set %sda.rank $replace($remove(%tmp,<img src=http://c3.img.netmarble.kr/web/2005_cp/img/suddenattack_v2/common/bl/,$chr(9),%sda.word2,02.gif,01.gif,align='absmiddle'><span class='blue p11'>,</td>,</span>),down_arrow ,▼,up_arrow ,▲)
  }
  if (%sda.word3 isin %tmp) { set %sda.grade $remove($gettok(%tmp,3,62),</td) }
  if (%sda.word4 isin %tmp) {
    set %sda.guild $remove($gettok(%tmp,4,62),</a)
    if (!%sda.guild) { set %sda.guild 없음 }
    timeoutoff    
    sockclose sda
    sockopen sda suddenattack.netmarble.net 80
    timeout 3 %sda.chan sda
    sockclose $sockname  
  }
  if (%sda.error isin %tmp) {
    timeoutoff
    privmsg %sda.chan 해당 플레이어의 정보를 찾을 수 없습니다. 아이디를 다시 한번 확인해주시기 바랍니다.
    sockclose $sockname
    unset %sda.*
  }
}
on *:sockopen:sda: {
  sockwrite -nt $sockname GET /ranking/PopUp/SaGameInfo.asp?UserID= $+ %sda.userid HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: suddenattack.netmarble.net
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname Accept: */*
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname $crlf
}
on *:sockread:sda: {
  sockread %tmp
  set %sda.pword suddenattack_v2/ranking/pop_txt04.gif"></td>
  set %sda.pword2 suddenattack_v2/ranking/pop_txt05.gif"></td>
  set %sda.pword3 suddenattack_v2/ranking/pop_txt07.gif" style="margin-left:1px;"></td>
  set %sda.pword4 suddenattack_v2/ranking/pop_txt08.gif" style="margin-left:1px;"></td>
  set %sda.pword5 suddenattack_v2/ranking/pop_txt09.gif" width="98" height="12" style="margin-left:1px;"></td>
  set %sda.pword6 suddenattack_v2/ranking/pop_txt10.gif" width="98" height="12" style="margin-left:1px;"></td>

  if (%sda.count == 2) { set %sda.exp $remove(%tmp,<td>,</td>,$chr(9)) | set %sda.count 1 }
  if (%sda.count == 3) { set %sda.point $remove(%tmp,<td>,</td>,$chr(9)) | set %sda.count 1 }
  if (%sda.count == 4) { set %sda.killed $remove(%tmp,<td>,</td>,$chr(9),&nbsp;) | set %sda.count 1 }
  if (%sda.count == 5) { set %sda.record $remove(%tmp,<td>,<strong>,</strong>,&nbsp;,<span style="color:#CC3300">,</span>,<span style="color:#0066CC">,</td>,$chr(9)) | set %sda.count 1 }
  if (%sda.count == 6) { set %sda.headshot $remove(%tmp,<td>,</td>,$chr(9)) | set %sda.count 1 }
  if (%sda.count == 7) { set %sda.ratio $remove(%tmp,<td>,</td>,$chr(9)) | set %sda.count 100 }

  if (%sda.count == 100) {
    timeoutoff
    sockclose sdat
    sockopen sdat suddenattack.netmarble.net 80
    timeout 3 %sda.chan sdat
    sockclose $sockname  
  }

  if (%sda.pword isin %tmp) { set %sda.count 2 }
  if (%sda.pword2 isin %tmp) { set %sda.count 3 }
  if (%sda.pword3 isin %tmp) { set %sda.count 4 }
  if (%sda.pword4 isin %tmp) { set %sda.count 5 }
  if (%sda.pword5 isin %tmp) { set %sda.count 6 }
  if (%sda.pword6 isin %tmp) { set %sda.count 7 }
}
on *:sockopen:sdat: {
  sockwrite -nt $sockname GET /Item/GInventory_Ranking.asp?UserID= $+ %sda.userid HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: suddenattack.netmarble.net
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname Accept: */*
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname $crlf
}
on *:sockread:sdat: {
  sockread %tmp
  set %sda.aword <td align="center" bgcolor="0B1D1A" class="w02"
  set %sda.end <td width="124"> &nbsp; </td>
  if (%sda.aword isin %tmp) { set %sda.weapon %sda.weapon $+ $chr(44) $gettok($gettok(%tmp,2,62),1,60) }
  if (%sda.end isin %tmp) {
    timeoutoff
    privmsg %sda.chan 아이디 : %sda.id / 순위 : %sda.rank / 계급 : %sda.grade / 클랜 : %sda.guild / 경험치 : %sda.exp / 게임포인트 : %sda.point
    privmsg %sda.chan 킬데스 : %sda.killed / 전적 : %sda.record / 헤드샷 : %sda.headshot / 승률 : %sda.ratio / 보유중인 주 무기 : $mid(%sda.weapon,3)
    sockclose $sockname
    unset %sda.*
  }
}
on *:sockopen:rnaver: {
  sockwrite -nt $sockname GET / HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: www.naver.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:rnaver: {
  sockread %tmp
  ; echo -a %tmp
  set %rnaver.word <li value=" $+ %rnaver.count $+ " class=
  set %rnaver.end <form action="http://search.naver.com/search.naver">

  if (%rnaver.word isin %tmp) {
    set %rnaver.result %rnaver.result $+ $chr(44) %rnaver.count $+ 위 : $dll(utf8.dll,convertlocal,$gettok($gettok(%tmp,3,62),1,60)) ( $+ $replace($gettok(%tmp,4,34),up,▲,down,▼) $+ $replace($gettok($gettok(%tmp,8,62),1,60),/li,$null) $+ )
    inc %rnaver.count
  }
  if (%rnaver.count == 11 || %rnaver.end isin %tmp) {
    timeoutoff
    privmsg %rnaver.chan 네이버 실시간 검색순위 - $mid(%rnaver.result,3)
    sockclose $sockname
    unset %rnaver.*
  }
}

on *:sockopen:ipwhois*: {
  sockwrite -nt $sockname GET /Search.aspx?query= $+ $urlencode($dll(utf8.dll,convertutf8,%ipw.id)) HTTP/1.1
  sockwrite -nt $sockname Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/x-ms-application, application/x-ms-xbap, application/vnd.ms-xpsdocument, application/xaml+xml, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*  
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Accept-Encoding: gzip, deflate  
  sockwrite -nt $sockname Host: www.ipsearch.co.kr
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname $crlf
}
on *:sockread:ipwhois: {
  sockread %tmp
  ; echo -a %tmp
  set %ipw.word1 <span id="lblIPAddress6">
  set %ipw.word2 <tr bgcolor="LightSkyBlue">
  set %ipw.word3 <span id="lblKeyword">
  set %ipw.word4 <td class="Cell" align="left" 
  set %ipw.word5 lblKeywordSearchResultComment

  if (%ipw.word1 isin %tmp) { set %ipw.status 1 }
  if (%ipw.word3 isin %tmp) { set %ipw.status 2 }

  if (%ipw.word5 isin %tmp) {
    timeoutoff
    privmsg %ipw.chan 검색 결과가 존재하지 않습니다. 다시한번 확인하여 주십시요.
    sockclose $sockname
    unset %ipw.*
  }

  if (%ipw.count == 3) {
    timeoutoff
    privmsg %ipw.chan $remove($dll(utf8.dll,convertlocal,%ipw.result),▼</a,[등록ip],[미등록ip])
    sockclose $sockname
    unset %ipw.*
  }

  if (%ipw.count == 2) {
    echo -a %tmp
    ; set %ipw.result [ $+ $remove($gettok(%tmp,11,62),</a,$chr(32)) $+ ] $gettok(%tmp,3,62) - $remove($gettok($gettok(%tmp,8,62),1,60),$chr(44)) $remove($gettok(%tmp,9,62),</a) 
    set %ipw.result [ $+ $remove($gettok(%tmp,11,62),</a,$chr(32)) $+ ] $gettok($gettok(%tmp,2,60),2,62)
    set %ipw.count 3
  }

  if (%ipw.status == 1 && %ipw.word2 isin %tmp) {
    set %ipw.count 2
  }
  if (%ipw.status == 2 && %ipw.word4 isin %tmp) {
    set %ipw.result [ $+ $remove($gettok(%tmp,11,62),</a,$chr(32)) $+ ] $remove($gettok(%tmp,3,62),</a) - $remove($gettok($gettok(%tmp,8,62),1,60),$chr(44)) $remove($gettok(%tmp,9,62),</a) 
    set %ipw.count 3
  }
}
on *:sockopen:weather*: {
  sockwrite -nt $sockname GET /ig/api?weather= $+ %weather.id2 HTTP/1.1
  sockwrite -nt $sockname Accept: */*
  sockwrite -nt $sockname Accept-Language: ko
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Accept-Encoding: gzip, deflate
  sockwrite -nt $sockname Host: www.google.co.kr
  sockwrite -nt $sockname Connection: Keep-Alive
  sockwrite -nt $sockname $crlf
}
on *:sockread:weather: {
  sockread %tmp
  ; echo -a %tmp
  set %weather.end </xml_api_reply>
  set %weather.error problem_cause data
  if (%weather.error isin %tmp) {
    timeoutoff
    privmsg %weather.chan 일시적으로 정보가 사용이 불가능한 지역이거나 검색이 지원되지 않는 지역입니다.
    sockclose $sockname
    unset %weather.*  
  }
  set %weather.province $replace($gettok($remove($gettok(%tmp,5,62),",/,<city data=),2,44),Gyeonggi-do,경기도,Gangwon-do,강원도,Chungcheongbuk-do,충청북도,Chungcheongnam-do,충청남도,Gyeongsangbuk-do,경상북도,Gyeongsangnam-do,경상남도,Jeollabuk-do,전라북도,Jeollanam-do,전라남도,Jeju-do,제주도)
  set %weather.date $remove($gettok(%tmp,10,62),<current_date_time data=,",$chr(47))
  set %weather.date $calc($gettok($gettok(%weather.date,2,32),1,58) + 9) $+ $chr(58) $+ $gettok($gettok(%weather.date,2,32),2-3,58)
  if ($gettok(%weather.date,1,58) >= 24) {
    set %weather.date $calc($gettok(%weather.date,1,58) - 24) $+ $chr(58) $+ $gettok(%weather.date,2-3,58)
  }
  set %weather.condition $remove($gettok(%tmp,14,62),<condition data=,",$chr(47))
  set %weather.tempf $remove($gettok(%tmp,15,62),<temp,$chr(95),data,=,",$chr(47))
  set %weather.tempc $remove($gettok(%tmp,16,62),<temp,$chr(95),data,=,",$chr(47))
  set %weather.humidity $remove($gettok(%tmp,17,62),<humidity data="습도: ,",$chr(47))
  set %weather.wind $remove($gettok(%tmp,19,62),<wind_condition data="바람: ,",$chr(47))
  ; set %weather.week $remove($gettok(%tmp,22,62),<day_of_week data=,",$chr(47))
  set %weather.tomorrow $remove($gettok(%tmp,26,62),<condition data=,",$chr(47))
  set %weather.tomorrow2 $remove($gettok(%tmp,29,62),<day_of_week data=,",$chr(47))
  set %weather.a3days $remove($gettok(%tmp,33,62),<condition data=,",$chr(47))
  set %weather.a3days2 $remove($gettok(%tmp,36,62),<day_of_week data=,",$chr(47))
  set %weather.kmh2ms $mid($calc($remove($gettok(%weather.wind,2,44),kmh) * 1000 / 3600),1,3) m/s
  if ($mid(%weather.tempc,3) <= 5) {
    set %weather.tmp $mid(%weather.tempc,3)
    set %weather.tmp2 $remove(%weather.kmh2ms,m/s,$chr(32))
    set %weather.human 체감기온 : $round($calc(33 - 0.045 * (10.45 + 10 * $sqrt(%weather.tmp2) - %weather.tmp2 ) * (33 - %weather.tmp )),2) °C/
    if ($mid($calc(33 - 0.045 * (10.45 + 10 * $sqrt(%weather.tmp2) - %weather.tmp2 ) * (33 - %weather.tmp )),1,6) >= 5) {
      unset %weather.human
    }
  }
  if (%weather.end isin %tmp) {
    timeoutoff
    if ($dll(hcheck.dll,HangulChk,%weather.id) == no) { unset %weather.province }
    privmsg %weather.chan [ $+ %weather.date 기준 %weather.province $replace(%weather.id,+,$chr(32)) $+ 의 날씨] - 상태 : %weather.condition / 기온 : $mid(%weather.tempc,3) °C ( $+ $mid(%weather.tempf,3) °F) / %weather.human 습도 : %weather.humidity / 풍속 : $replace(%weather.wind,kmh,km/h) ( $+ %weather.kmh2ms $+ ) / 내일( $+ %weather.tomorrow2 $+ ) : %weather.tomorrow / 모래( $+ %weather.a3days2 $+ ) : %weather.a3days
    sockclose $sockname
    ; unset %weather.*  
  }
}
on *:sockread:dcnew: {
  sockread %tmp
  set %dcnew.word1 span style=font-size:8pt;font-family:tahoma color=000000>
  set %dcnew.word2 onClick=nameSearch(this)

  if (%dcnew.count == 2) {
    set %dcnew.subject $dll(utf8.dll,convertlocal,$remove($gettok(%tmp,4,62),</a))
    set %dcnew.num http://gall.dcinside.com/ $+ %dcnew.id $+ / $+ $remove($gettok($remove($gettok(%tmp,3,62),<a href=",$chr(9),"),3,61),&page)
    set %dcnew.count 77
  }
  if (%dcnew.word1 isin %tmp) { set %dcnew.count 2 }
  if (%dcnew.word2 isin %tmp && %dcnew.count == 77) {
    set %dcnew.nick $dll(utf8.dll,convertlocal,$remove($gettok($gettok(%tmp,1,47),2,62),<span title=,',<))
    set %dcnew.end 1
  }
  if (%dcnew.end == 1) {
    timeoutoff
    if (%dcnew.subject != %dc.new1 || %dcnew.nick != %dc.new2) {
      privmsg %dcnew.chan [새글알림] %dcnew.subject - %dcnew.nick ( $+ %dcnew.num $+ )
    }
    set %dc.new1 %dcnew.subject
    set %dc.new2 %dcnew.nick
    sockclose $sockname
    unset %dcnew.*  
  }
}
on *:sockopen:dcnew*: {
  sockwrite -nt $sockname GET /list.php?id= $+ %dcnew.id HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: gall.dcinside.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockopen:lyric: {
  sockwrite -nt $sockname GET /search.naver?sm=tab_hty&where=music_lyric&query= $+ %lyric.id2 HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: music.search.naver.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:lyric: {
  sockread %tmp
  ; echo -a %tmp
  set %lyric.word1 ;return false" target="_blank" >
  set %lyric.word2 </a></span></dd></dl></li>
  set %lyric.error 검색결과가 없습니다

  if (%lyric.error isin %tmp) {
    sockclose $sockname
    timeoutoff    
    privmsg %lyric.chan  $+ %lyric.id $+ 에 대한 검색결과가 없습니다. 단어의 철자가 정확한지 확인하시고 검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.
  }
  if (%lyric.word1 isin %tmp && %lyric.count == 1) { write tmp_lyric.txt %tmp | set %lyric.count 2 }
  if (%lyric.word2 isin $remove(%tmp,$chr(32)) && %lyric.count == 2) {
    sockclose $sockname
    timeoutoff    
    set %lyric.title $remove($gettok($gettok($read(tmp_lyric.txt),26,59),1-3,47),return false" target="_blank" >,<strong>,</strong>,<a href=#,onClick=,</a>,"window.open $+ $chr(40) $+ 'http:/musicsearch.naver.com,<,"window.open $+ $chr(40) $+ 'http:)
    set %lyric.desc $replace($remove($gettok($gettok($read(tmp_lyric.txt),27-30,59),14,34),</a>,</dt>,<dd>,</dd>,<dd class=),<strong>,,</strong>,)
    set %lyric.singer $remove($gettok($gettok($read(tmp_lyric.txt),27-30,59),20,34),</a>,</span>,<span class=,>)
    set %lyric.album $remove($gettok($gettok($read(tmp_lyric.txt),27-30,59),28,34),</a>,</span>,</dd>,</dl>,</li>,<li>,<dl>,<dt>,<a href=# onClick=,</ul>,<div class=,>)
    privmsg %lyric.chan 제목 : %lyric.title / 가수 : %lyric.singer / 앨범 : %lyric.album
    privmsg %lyric.chan 가사 : $remove(%lyric.desc,</strong,<strong,</dd,<span,</span,>)
    sockwrite -nt Zodbot notice %lyric.nick : $+ 가사URL : $gettok($gettok($read(tmp_lyric.txt),3,35),2,39)
    unset %lyric.*
  }
}
on *:sockopen:tweeter2: {
  sockwrite -nt $sockname GET / $+ %tweet.id HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: twitter.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:tweeter2: {
  sockread %tmp
  set %tweet.word1 <div class="screen-name">
  set %tweet.word2 <span class="entry-content">
  set %tweet.word3 <span class="published timestamp"
  set %tweet.word4 <span class="meta entry-meta" data='{}'>
  set %tweet.word5 <span>via
  set %tweet.lock This person has protected their tweets
  set %tweet.end <div id="pagination">
  set %tweet.error HTTP/1.1 404 Not Found
  set %tweet.error2 Location: http://www.warning.or.kr

  if (%tweet.word1 isin %tmp && %tweet.count == 1) {
    set %tweet.count 2
    set %tweet.name $sremover($remove(%tmp,%tweet.word1,</div>))
  }
  if (%tweet.word4 isin %tmp) { set %tweet.count 2 }
  if (%tweet.count == 3 && %tweet.word4 !isin %tmp) {
    set %tweet.result $sremover($remove($dll(utf8.dll,convertlocal,%tmp),%tweet.word2,</a>,</span>))
    if ($chr(60) isin %tweet.result) {
      var %i 1
      set %tweet.storm 1
      while (%i <= $len(%tweet.result)) {      
        if ($mid(%tweet.result,%i,1) == $chr(60)) { set %tweet.storm 2 }
        if ($mid(%tweet.result,%i,1) != $chr(60) && %tweet.storm == 1) {
          set %tweet.result1 %tweet.result1 $+ $replace($mid(%tweet.result,%i,1),$chr(32),$chr(127))
        }
        if ($mid(%tweet.result,%i,1) == $chr(62)) { set %tweet.storm 1 }
        inc %i
      }    
    }
    else { set %tweet.result1 $replace(%tweet.result1,羲羲,$chr(32)) $+ $replace(%tweet.result,羲羲,$chr(32)) }
  }
  if (%tweet.word2 isin %tmp) {
    set %tweet.result $sremover($remove($dll(utf8.dll,convertlocal,%tmp),%tweet.word2,</a>,</span>))
    if ($chr(60) isin %tweet.result) {
      var %i 1
      set %tweet.storm 1
      while (%i <= $len(%tweet.result)) {      
        if ($mid(%tweet.result,%i,1) == $chr(60)) { set %tweet.storm 2 }
        if ($mid(%tweet.result,%i,1) != $chr(60) && %tweet.storm == 1) {
          set %tweet.result1 %tweet.result1 $+ $replace($mid(%tweet.result,%i,1),$chr(32),$chr(127))
        }
        if ($mid(%tweet.result,%i,1) == $chr(62)) { set %tweet.storm 1 }
        inc %i
      }    
    }
    else { set %tweet.result1 %tweet.result }
    set %tweet.count 3
  }
  if (%tweet.word3 isin %tmp) { set %tweet.time $replace($remove($gettok(%tmp,2,62),</span),about,약,half a minute ago,30초 전,hours ago,시간 전,minutes ago,분 전,seconds ago,초 전,less than,약) }
  if (%tweet.word5 isin %tmp) {
    timeoutoff
    set %tweet.result1 $replace(%tweet.result1,$chr(127),$chr(32))    
    set %tweet.route $remove(%tmp,%tweet.word5,</span>,<a href="http://www.twittergadget.com" rel="nofollow">,</a>)
    if (%tweet.result1 != %tweetsaved) {
      privmsg %tweet.chan  $+ $chr(91) $+ New Tweet $+ $chr(93) $+  %tweet.result1 (http://twitter.com/ $+ %tweet.id $chr(45) %tweet.time $nickdt(%tweet.name) $+ 이(가) %tweet.route $+ 에서 남김)
      set %tweetsaved %tweet.result1
    }
    sockclose $sockname
    unset %tweet.*      
  }
}
on *:sockopen:tweeter: {
  sockwrite -nt $sockname GET / $+ %tweet.id HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: twitter.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:tweeter: {
  sockread %tmp
  ; echo -a %tmp
  set %tweet.word1 <div class="screen-name">
  set %tweet.word2 <span class="entry-content">
  set %tweet.word3 <span class="published timestamp"
  set %tweet.word4 <span class="meta entry-meta" data='{}'>
  set %tweet.word5 <span>via
  set %tweet.lock This person has protected their tweets
  set %tweet.end <div id="pagination">
  set %tweet.error HTTP/1.1 404 Not Found
  set %tweet.error2 Location: http://www.warning.or.kr

  if (%tweet.error isin %tmp) {
    timeoutoff
    privmsg %tweet.chan [4!1] 입력하신 사용자를 찾을 수 없습니다.
    sockclose $sockname
    unset %tweet.*
  }
  if (%tweet.error2 isin %tmp) {
    timeoutoff
    privmsg %tweet.chan [4!1] 요청하신 연결은 법률상 금지하는 불법적인 내용을 가지고 있어 해당 사이트에 대한 접속이 차단 되었음을 알려드립니다.
    sockclose $sockname
    unset %tweet.*
  }
  if (%tweet.lock isin %tmp) {
    timeoutoff
    privmsg %tweet.chan [4!1] 입력하신 사용자는 tweet을 비공개로 설정하였으므로 내용을 출력할 수 없습니다.
    sockclose $sockname
    unset %tweet.*
  }
  if (%tweet.end isin %tmp) {
    timeoutoff
    privmsg %tweet.chan [4!1] 입력하신 사용자의 tweet이 존재하지 않습니다.
    sockclose $sockname
    unset %tweet.*
  }
  if (%tweet.word1 isin %tmp && %tweet.count == 1) {
    set %tweet.count 2
    set %tweet.name $sremover($remove(%tmp,%tweet.word1,</div>))
  }
  if (%tweet.word4 isin %tmp) { set %tweet.count 2 }
  if (%tweet.count == 3 && %tweet.word4 !isin %tmp) {
    set %tweet.result $sremover($remove($dll(utf8.dll,convertlocal,%tmp),%tweet.word2,</a>,</span>))
    if ($chr(60) isin %tweet.result) {
      var %i 1
      set %tweet.storm 1
      while (%i <= $len(%tweet.result)) {      
        if ($mid(%tweet.result,%i,1) == $chr(60)) { set %tweet.storm 2 }
        if ($mid(%tweet.result,%i,1) != $chr(60) && %tweet.storm == 1) {
          set %tweet.result1 %tweet.result1 $+ $replace($mid(%tweet.result,%i,1),$chr(32),$chr(127))
        }
        if ($mid(%tweet.result,%i,1) == $chr(62)) { set %tweet.storm 1 }
        inc %i
      }    
    }
    else { set %tweet.result1 $replace(%tweet.result1,羲羲,$chr(32)) $+ $replace(%tweet.result,羲羲,$chr(32)) }
  }
  if (%tweet.word2 isin %tmp) {
    set %tweet.result $sremover($remove($dll(utf8.dll,convertlocal,%tmp),%tweet.word2,</a>,</span>))
    if ($chr(60) isin %tweet.result) {
      var %i 1
      set %tweet.storm 1
      while (%i <= $len(%tweet.result)) {      
        if ($mid(%tweet.result,%i,1) == $chr(60)) { set %tweet.storm 2 }
        if ($mid(%tweet.result,%i,1) != $chr(60) && %tweet.storm == 1) {
          set %tweet.result1 %tweet.result1 $+ $replace($mid(%tweet.result,%i,1),$chr(32),$chr(127))
        }
        if ($mid(%tweet.result,%i,1) == $chr(62)) { set %tweet.storm 1 }
        inc %i
      }    
    }
    else { set %tweet.result1 %tweet.result }
    set %tweet.count 3
  }
  if (%tweet.word3 isin %tmp) { set %tweet.time $replace($remove($gettok(%tmp,2,62),</span),about,약,half a minute ago,30초 전,hours ago,시간 전,minutes ago,분 전,seconds ago,초 전,less than,약) }
  if (%tweet.word5 isin %tmp) {
    timeoutoff
    set %tweet.result1 $replace(%tweet.result1,$chr(127),$chr(32))    
    set %tweet.route $remove(%tmp,%tweet.word5,</span>,<a href="http://www.twittergadget.com" rel="nofollow">,</a>)
    privmsg %tweet.chan  $+ $chr(91) $+ %tweet.name $+ $chr(93) $+  %tweet.result1 (http://twitter.com/ $+ %tweet.id $chr(45) %tweet.time $+ $chr(44) %tweet.route $+ 에서 남김)
    sockclose $sockname
    unset %tweet.*      
  }
}
on *:sockopen:kartrider*: {
  sockwrite -nt $sockname GET /camp/Page/GnxPop.aspx?URL=GameProfile/GarageHome&strRiderID= $+ %kart.id HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: kart.nexon.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:kartrider: {
  sockread %tmp
  ; echo -a %tmp
  set %kart.name <span id="RiderName">
  set %kart.glove <div id="GloveImg">
  set %kart.license <div id="LicenseImg">
  set %kart.rp <h3>RP</h3>
  set %kart.grand <h3>그랑프리</h3>
  set %kart.emblem <h3>엠블럼</h3>
  set %kart.itm1 <dt>대표아이템0</dt>
  set %kart.itm2 <dt>대표아이템1</dt>
  set %kart.itm3 <dt>대표아이템2</dt>
  set %kart.pitm <span class="TxtItem">
  set %kart.pemb <span class="TxtEm">
  set %kart.end <span id='EmblemDesc2'>
  set %kart.nitm 아이템 없음 $+ $chr(44) 아이템 없음 $+ $chr(44) 아이템 없음
  set %kart.error <script>history.back( -1 ); 
  if (%kart.error isin %tmp) {
    timeoutoff
    privmsg %kart.chan 해당 라이더를 찾을 수 없습니다.
    sockclose $sockname
    unset %kart.*
  }
  if (%kart.pitm isin %tmp) { set %kart.count 70 }
  if (%kart.pemb isin %tmp) { set %kart.count 80 }
  if (%kart.count == 70) { set %kart.rpitm %kart.rpitm $+ $chr(44) $remove(%tmp,%kart.pitm,$chr(9),</span>) | set %kart.count 1 }
  if (%kart.count == 80) {
    var %kart.tmp2 $remove(%tmp,%kart.pemb,$chr(9),</span>)
    if (%kart.tmp2) { set %kart.rpemb %kart.rpemb $+ $chr(44) $remove(%tmp,%kart.pemb,$chr(9),</span>) }
    set %kart.count 1
  }
  if (%kart.name isin %tmp) { set %kart.id $remove(%tmp,$chr(9),%kart.name,</span>) }
  if (%kart.count == 8) { set %kart.ritm1 $replace($remove(%tmp,<dd>,<b>,</b>,</dd>,$chr(9),현재,을 보유하고 있습니다.),카트바디 아이템,카트바디) | set %kart.count 1 }
  if (%kart.count == 9) { set %kart.ritm2 $replace($remove(%tmp,<dd>,<b>,</b>,</dd>,$chr(9),현재,을 보유하고 있습니다.),카트바디 아이템,카트바디) | set %kart.count 1 }
  if (%kart.count == 10) { set %kart.ritm3 $replace($remove(%tmp,<dd>,<b>,</b>,</dd>,$chr(9),현재,을 보유하고 있습니다.),카트바디 아이템,카트바디) | set %kart.count 1 }

  if (%kart.count == 7) { set %kart.remblem2 $remove(%tmp,<span class="RecordData2">,$chr(9),<span>,</span>) | set %kart.count 1 }
  if (%kart.count == 6) { set %kart.remblem1 $remove(%tmp,<span class="RecordData1">,$chr(9),<span>,</span>,위) | set %kart.count 7 }

  if (%kart.count == 5) { set %kart.rgrand3 $remove(%tmp,<span class="RecordData2">,$chr(9),<span>,</span>,점) | set %kart.count 1 }
  if (%kart.count == 4) { set %kart.rgrand2 $remove(%tmp,<span class="RecordData1">,$chr(9),<span>,</span>,위) | set %kart.count 5 }
  if (%kart.count == ex) { set %kart.rgrand1 $remove(%tmp,<span class="RecordData0">,$chr(9),<span>,</span>) | set %kart.count 4 }

  if (%kart.count == 3) { set %kart.rp2 $remove(%tmp,<span class="RecordData2">,$chr(9),<span>,</span>,점) | set %kart.count 1 }
  if (%kart.count == 2) { set %kart.rp1 $remove(%tmp,<span class="RecordData1">,$chr(9),<span>,</span>,위) | set %kart.count 3 }

  if (%kart.glove isin %tmp) { set %kart.rglove $remove(%tmp,$chr(9),hand_,.gif,_23,%kart.glove,<img src="http://s.nx.com/s2/game/Kart/kart/hands/," width="23" height="23" alt="장갑" /></div>) }
  if (%kart.license isin %tmp) { set %kart.rlicense $remove(%tmp,$chr(9),%kart.license,<img src="http://s.nx.com/S2/game/kart/Kart/license/," width="23" height="23" alt="라이센스" /></div>) }
  if (%kart.rp isin %tmp) { set %kart.count 2 }
  if (%kart.grand isin %tmp) { set %kart.count ex }
  if (%kart.emblem isin %tmp) { set %kart.count 6 }
  if (%kart.itm1 isin %tmp) { set %kart.count 8 }
  if (%kart.itm2 isin %tmp) { set %kart.count 9 }
  if (%kart.itm3 isin %tmp) { set %kart.count 10 }

  if (%kart.end isin %tmp) {
    timeoutoff
    set %kart.rlicense $replace(%kart.rlicense,0.gif,라이센스 없음,1.gif,Rookie,2.gif,L3,3.gif,L2,4.gif,L1,5.gif,프로)
    set %kart.rglove $replace(%kart.rglove,01,하얀5,02,하얀4,06,노랑5,07,노랑4,08,노랑3,09,노랑2,10,노랑1)
    set %kart.rglove $replace(%kart.rglove,11,초록5,12,초록4,13,초록3,14,초록2,15,초록1)
    set %kart.rglove $replace(%kart.rglove,16,파랑5,17,파랑4,18,파랑3,19,파랑2,20,파랑1)
    set %kart.rglove $replace(%kart.rglove,21,빨강5,22,빨강4,23,빨강3,24,빨강2,25,빨강1)
    set %kart.rglove $replace(%kart.rglove,26,검정5,27,검정4,28,검정3,29,검정2,30,검정1)
    set %kart.rglove $replace(%kart.rglove,31,무지개5,32,무지개4,33,무지개3,34,무지개2,35,무지개1)
    set %kart.rglove $replace(%kart.rglove,36,스타노랑5,37,스타노랑4,38,스타노랑3,39,스타노랑2,40,스타노랑1)
    set %kart.rglove $replace(%kart.rglove,41,스타초록5,42,스타초록4,43,스타초록3,44,스타초록스타2,45,스타초록1)
    set %kart.rglove $replace(%kart.rglove,46,스타파랑5,47,스타파랑4,48,스타파랑3,49,스타파랑2,50,스타파랑1)
    set %kart.rglove $replace(%kart.rglove,51,스타빨강5,52,스타빨강4,53,스타빨강3,54,스타빨강2,55,스타빨강1)
    set %kart.rglove $replace(%kart.rglove,56,스타검정5,57,스타검정4,58,스타검정3,59,스타검정2,60,스타검정1)
    set %kart.rglove $replace(%kart.rglove,61,스타무지개5,62,스타무지개4,63,스타무지개3,64,스타무지개2,65,스타무지개1)
    set %kart.rglove $replace(%kart.rglove,66,옐로스타1,67,옐로스타2,68,옐로스타3,69,옐로스타4,70,옐로스타5)
    set %kart.rglove $replace(%kart.rglove,71,그린스타1,72,그린스타2,73,그린스타3,74,그린스타4,75,그린스타5)
    set %kart.rglove $replace(%kart.rglove,76,블루스타1,77,블루스타2,78,블루스타3,79,블루스타4,80,블루스타5)
    set %kart.rglove $replace(%kart.rglove,81,레드스타1,82,레드스타2,83,레드스타3,84,레드스타4,85,레드스타5)
    set %kart.rglove $replace(%kart.rglove,86,블랙스타1,87,블랙스타2,88,블랙스타3,89,블랙스타4,90,블랙스타5)
    set %kart.rglove $replace(%kart.rglove,91,레인보우스타1,92,레인보우스타2,93,레인보우스타3,94,레인보우스타4,95,레인보우스타5)
    set %kart.next $readini(kart.ini,$remove(%kart.rglove,1,2,3,4,5),%kart.rglove)
    set %kart.previous $readini(kart.ini,$remove(%kart.rglove,1,2,3,4,5),$remove(%kart.rglove,$right(%kart.rglove,1)) $+ $calc($right(%kart.rglove,1) + 1)))

    set %kart.aglove $remove(%kart.rglove,1,2,3,4,5)
    if (%kart.aglove == 옐로스타 || %kart.aglove == 그린스타 || %kart.aglove == 블루스타 || %kart.aglove == 레드스타 || %kart.aglove == 블랙스타 || %kart.aglove == 레인보우스타) {
      set %kart.next $readini(kart.ini,$remove(%kart.rglove,1,2,3,4,5),$remove(%kart.rglove,$right(%kart.rglove,1)) $+ $calc($right(%kart.rglove,1) + 1)))
      set %kart.previous $readini(kart.ini,$remove(%kart.rglove,1,2,3,4,5),$remove(%kart.rglove,$right(%kart.rglove,1)) $+ $right(%kart.rglove,1)))
    }

    set %kart.rph $calc(%kart.rp2 - %kart.previous)
    set %kart.range $calc(%kart.next - %kart.previous)
    set %kart.rpresult $calc(%kart.rph / %kart.range * 100)

    if (%kart.ritm1 !isin %kart.itmlist) { set %kart.itmlist %kart.itmlist $+ $chr(44) %kart.ritm1 }
    if (%kart.ritm2 !isin %kart.itmlist) { set %kart.itmlist %kart.itmlist $+ $chr(44) %kart.ritm2 }
    if (%kart.ritm3 !isin %kart.itmlist) { set %kart.itmlist %kart.itmlist $+ $chr(44) %kart.ritm3 }

    set %kart.rpitm $mid(%kart.rpitm,2)
    set %kart.rpemb $mid(%kart.rpemb,2)
    if (!%kart.ritm1) { set %kart.itmlist 111아이템 : 목록을 가져올 수 없습니다. (차고주인이 아이템 목록을 비공개로 설정) }
    if (%kart.rpitm == $chr(32) $+ %kart.nitm) { set %kart.rpitm 없음 }
    if (!%kart.rpemb) { set %kart.rpemb 없음 }
    if (%kart.license == 0.jpg) { set %kart.license 없음 }
    ; echo -a 존재함 / %kart.rglove
    privmsg %kart.chan 라이더명 : %kart.id / 글러브 : %kart.rglove / 라이센스 : %kart.rlicense  / 순위 : $comgen(%kart.rp1) $+ 위  / RP : $comgen(%kart.rp2) (Lvup 까지 + $+ $comgen($calc(%kart.next - %kart.rp2)) $+ ) $percent(%kart.rpresult,100,30)
    privmsg %kart.chan 앰블럼개수 : %kart.remblem2 / 앰블럼순위 : $comgen(%kart.remblem1) $+ 위 / 최근 참가한 그랑프리명 : %kart.rgrand1 / 점수 : $comgen(%kart.rgrand3) $+ 점 / 순위 : $comgen(%kart.rgrand2) $+ 위 
    privmsg %kart.chan 대표아이템 : %kart.rpitm $+ ( $+ $mid(%kart.itmlist,4) $+ ) / 대표엠블럼 : %kart.rpemb
    sockclose $sockname
    unset %kart.*
  }
}
on *:sockopen:monsearch*: {
  sockwrite -nt $sockname GET /search/search_list.php?so=monster&search_text= $+ $bin2hex(%mon.name) HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: barch.kr
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:monsearch: {
  sockread %tmp
  set %mon.word <TD align=middle bgColor=#e1e1df width="100"><B><span style="font-size:9pt;"> $+ %mon.name
  set %mon.descr <TD style="PADDING-LEFT: 10px; PADDING-TOP: 5px" bgColor=#eff0e9>
  set %mon.expitm <TD align=middle bgColor=#eff0e9 width="90"><span style="font-size:9pt;">
  set %mon.error <div style="width: 100%; padding: 30 0 0 30px;font-size: 11pt;"><span class=keyword>
  set %mon.error2 </tbody>
  if (%mon.word isin %tmp) { set %mon.en on }
  if (%mon.error isin %tmp) {
    timeoutoff
    privmsg %mon.chan " $+ %mon.name $+ " 의 검색결과를 찾을 수 없습니다.
    sockclose $sockname
    unset %mon.*
  }
  if (%mon.error2 isin %tmp) {
    timeoutoff
    privmsg %mon.chan " $+ %mon.name $+ " 의 검색결과를 찾을 수 없습니다.
    sockclose $sockname
    unset %mon.*
  }
  if (%mon.en == on) {
    if (%mon.descr isin %tmp) { set %mon.result1 $remove(%tmp,%mon.descr,</TD>,<span class=keyword>,</span>) }
    if (%mon.expitm isin %tmp) {
      if (%mon.count == 2) {
        set %mon.result3 $remove(%tmp,%mon.expitm,<span class=keyword>,</span>,</TD>)
        set %mon.count 99
      }
      else {
        set %mon.result2 $remove(%tmp,%mon.expitm,</span></TD>)
        set %mon.count 2
      }
    }
    if (%mon.count == 99) {
      timeoutoff
      privmsg %mon.chan 몬스터명 : %mon.name / 경험치 : $comgen(%mon.result2) / 획득아이템 : %mon.result3
      privmsg %mon.chan 설명 : %mon.result1
      sockclose $sockname
      unset %mon.*
    }
  }
}
on *:sockopen:branksearch*: {
  sockwrite -nt $sockname GET /baram/page/Gnx.aspx?URL=ranking/ranking_list&maskGameCode= $+ %branksearch.server $+ &codeGameJob_search= $+ %branksearch.job $+ &n4Rank_start= $+ %branksearch.rank HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: baram.nexon.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:branksearch: {
  sockread %tmp
  ; 순위
  set %branksearch.search1 RankingNum
  ; 아이디명
  set %branksearch.search2 RankingGameID
  ; 직업명
  ; 승급차수
  set %branksearch.search3 GnxRankingGradeViewer
  ; 순위변동
  set %branksearch.search4 RankingGap

  ; End line
  set %branksearch.end <tr bgcolor="#D9DFEB" height="27">
  if (%branksearch.search1 isin %tmp) {
    set %branksearch.result1 $remove(%tmp,$chr(9),<td>,<input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,gRankingNum' id='G_Ranking_list1_rpRankingSubList__ctl,gRankingNum' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,gRankingNum = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,gRankingNum','G:Ranking_list1:rpRankingSubList:_ctl,:gRankingNum',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingNum_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingNum_CheckValidation(),return true;,)
    set %branksearch.result1 $remove(%branksearch.result1,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankingnumviewer1' id='G_Ranking_list1_rpRankingSubList__ctl,Gnxrankingnumviewer1' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,Gnxrankingnumviewer1 = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl2:Gnxrankingnumviewer1','G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankingnumviewer1',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankingnumviewer1_PrePostBack(),</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankingnumviewer1_CheckValidation)
    set %branksearch.result1 $remove(%branksearch.result1,$chr(9),return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankingnumviewer1_PostBack_WiseLogCreator(),</script>,</td>)
    set %branksearch.result1 $remove(%branksearch.result1,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,gRankingNum_PostBack_WiseLogCreator,</script>,</td>,$chr(40),$chr(41),$chr(123),$chr(125),$chr(44),$chr(32))
    set %branksearch.result1 $deltok(%branksearch.result1,1-5,95)
  }
  if (%branksearch.search2 isin %tmp) {
    set %branksearch.result2 $remove(%tmp,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,gRankingGameID' id='G_Ranking_list1_rpRankingSubList__ctl,gRankingGameID' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,gRankingGameID = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,gRankingGameID','G:Ranking_list1:rpRankingSubList:_ctl,gRankingGameID',;</script>,<script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingGameID_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingGameID_CheckValidation,return true;)
    set %branksearch.result2 $remove(%branksearch.result2,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggameidviewer1' id='G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggameidviewer1' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggameidviewer1 = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl2:Gnxrankinggameidviewer1','G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggameidviewer1',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggameidviewer1_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggameidviewer1_CheckValidation)
    set %branksearch.result2 $remove(%branksearch.result2,$chr(9),return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggameidviewer1_PostBack_WiseLogCreator(),</td>,</script>)
    set %branksearch.result2 $remove(%branksearch.result2,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,gRankingGameID_PostBack_WiseLogCreator(),</script>,</td>,$chr(40),$chr(41),$chr(123),$chr(125),$chr(44).$chr(32))
    set %branksearch.result2 $remove($deltok(%branksearch.result2,1-5,95),$chr(32))
    if (%branksearch.result2 == %branksearch.id) { set %branksearch.EN 1 }
  }
  if (%branksearch.end isin %tmp) {
    if (%branksearch.scount >= 15) {
      privmsg %branksearch.chan 해당 아이디의 순위를 찾을 수 없습니다. 순위 지원은 %branksearch.orank $+ 위~ $+ $calc(%branksearch.orank + 299) $+ 위까지만 지원합니다.
      ; privmsg %branksearch.chan " $+ %branksearch.command 300 $+ " 과 같이 입력하시면 300위(시작범위)부터 599위까지 검색이 가능하니 추가적으로 검색해보시기 바랍니다.
      timeoutoff
      sockclose $sockname
      ; unset %branksearch.*  
    }
    else {
      set %branksearch.rank $calc(%branksearch.rank + 20)
      inc %branksearch.scount
      sockclose $sockname
      sockopen branksearch baram.nexon.com 80
      timeout 15 %branksearch.chan branksearch
    }
  }
  if (%branksearch.EN == 1) {
    if (%branksearch.search3 isin %tmp) {
      set %branksearch.result3 $remove(%tmp,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,GnxRankingGradeViewer' id='G_Ranking_list1_rpRankingSubList__ctl,GnxRankingGradeViewer' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,GnxRankingGradeViewer = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,GnxRankingGradeViewer','G:Ranking_list1:rpRankingSubList:_ctl,GnxRankingGradeViewer',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,GnxRankingGradeViewer_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,GnxRankingGradeViewer_CheckValidation)
      set %branksearch.result3 $remove(%branksearch.result3,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggradeviewer1' id='G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggradeviewer1' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggradeviewer1 = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggradeviewer1','G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggradeviewer1',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggradeviewer1_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggradeviewer1_CheckValidation)
      set %branksearch.result3 $remove(%branksearch.result3,$chr(9),return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggradeviewer1_PostBack_WiseLogCreator,</script>,</td>)
      set %branksearch.result3 $remove(%branksearch.result3,$chr(9),return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,GnxRankingGradeViewer_PostBack_WiseLogCreator,</script>,</td>)
      set %branksearch.result3 $remove(%branksearch.result3,$chr(9),$chr(40),$chr(41),$chr(123),$chr(125),$chr(44),$chr(32))
      set %branksearch.result3 $deltok(%branksearch.result3,1-5,95)
    }
    if (%branksearch.search4 isin %tmp) {
      set %branksearch.result4 $remove(%tmp,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,gRankingGap' id='G_Ranking_list1_rpRankingSubList__ctl,gRankingGap',value=''>,<script>var G_Ranking_list1_rpRankingSubList__ctl,gRankingGap = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,gRankingGap','G:Ranking_list1:rpRankingSubList:_ctl,gRankingGap',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingGap_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,gRankingGap_CheckValidation,return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,gRankingGap_PostBack_WiseLogCreator)
      set %branksearch.result4 $remove(%branksearch.result4,$chr(9),<td><input type='hidden' name='G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggapviewer1' id='G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggapviewer1' value=''><script>var G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggapviewer1 = new GnxControlClientProxy,'G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggapviewer1','G:Ranking_list1:rpRankingSubList:_ctl,Gnxrankinggapviewer1',;</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggapviewer1_PrePostBack,</script><script>function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggapviewer1_CheckValidation)
      set %branksearch.result4 $remove(%branksearch.result4,$chr(9),return true;,</script><script> function G_Ranking_list1_rpRankingSubList__ctl,Gnxrankinggapviewer1_PostBack_WiseLogCreator,</script>,</td>)
      set %branksearch.result4 $remove(%branksearch.result4,$chr(9),</script>,</td>,$chr(40),$chr(41),$chr(123),$chr(125),$chr(44),$chr(32))
      set %branksearch.result4 $deltok(%branksearch.result4,1-5,95)
      set %branksearch.result 1
    }
    if (%branksearch.result == 1) {
      timeoutoff
      set %branksearch.cjob $readini(brankdata.ini,%branksearch.result3,%branksearch.ojob)
      privmsg %branksearch.chan 서버 : %branksearch.oserver / 직업 : %branksearch.cjob / 순위 : %branksearch.result1 / 아이디 : %branksearch.result2 / 승급차수 : %branksearch.result3 $+ 차 / 순위변동 : %branksearch.result4
      sockclose $sockname
      unset %branksearch.*
    }
  }
}
on *:sockopen:idsearch*: {
  sockwrite -nt $sockname GET /Baram/Page/GnxNoMsg.aspx?url=Profile/Profile02&loginID= $+ %idsearch.id $+ $chr(64) $+ %idsearch.server HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: baram.nexon.com
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:idsearch: {
  sockread %tmp
  set %searchword document.write("<a href='gnxNoMsg.aspx?url=Profile/Profile02&loginID=
  set %searchword2 <a href='/Isolation/Baram/Page/Gnx.aspx?url=Login/GetUserInfo&amp;localID=
  set %searchword3 <!-- ITEM LIST -->
  set %searchword4 height="11" align="absmiddle">
  set %searchword5-1 http://s.nx.com/S2/game/baram/baram/image/profile/ico_sex01.gif
  set %searchword5-2 http://s.nx.com/S2/game/baram/baram/image/profile/ico_sex02.gif
  set %searchword6 <td><font class="memo-name"><a href="gnxnomsg.aspx?url=profile/profile02&loginID=
  set %errormode <a href='http://bulletin.nexon.com/baram/launcher.html?ReturnUrl=
  set %errormode2 <title>Object reference not set to an instance of an object.</title>
  set %errormode3 function PageNav(maxPageNo, curPageNo)
  set %errormode4 <script>history.back( -1 ); window.open( '../../Common/Notify/Notify.aspx?strMessage=
  set %errormode5 http://bulletin.nexon.com/bulletin/game_5xx.html'
  if (%searchword5-1 isin %tmp) { set %idsearch.sex 남 }
  if (%searchword5-2 isin %tmp) { set %idsearch.sex 여 }
  if (%searchword6 isin %tmp) {
    set %idsearch.memo $remove(%tmp,%searchword6,<font class="memo-day">,</font><input name="G:rptGuestBook:_ctl1:hdMaskGameCode_writer" id="G_rptGuestBook__ctl1_hdMaskGameCode_writer",type="hidden" value="131076" />,<input name="G:rptGuestBook:_ctl1:hdOidUser_writer" id="G_rptGuestBook__ctl1_hdOidUser_writer",type="hidden" value="671098886" /></td>)
    set %idsearch.memo $remove(%idsearch.memo,$chr(9),</a>,</font>,type="hidden" value=",",</td,/)
    set %idsearch.memo $gettok($deltok(%idsearch.memo,1,62),1,41) $+ $chr(41)
    set %idsearch.count 1
  }
  if (%errormode3 isin %tmp) {
    set %idsearch.count 1
  }
  if (%errormode4 isin %tmp) {
    set %idsearch.count 8
  }
  if (%errormode5 isin %tmp) {
    set %idsearch.count 9
  }
  if (%idsearch.count == 3) {
    set %idsearch.itm $mid($remove(%tmp,$chr(9),:,",45,10,<script language=javascript>,document.write,GetDrawItemIconStr,</script>),3)
    var %i 0 | set %amitm 0
    while (%i < $len(%idsearch.itm)) { if ($mid(%idsearch.itm,%i,1) == $chr(59)) { inc %amitm } | inc %i }
    var %j 1
    if ($exists(tmp_itm.txt)) { remove tmp_itm.txt }
    while (%j <= %amitm) { write tmp_itm.txt $gettok(%idsearch.itm,%j,59) | inc %j }
    set %idsearch.count 7
  }
  if (%idsearch.count == 4) {
    var %i 0
    while (%i <= $lines(joblist.txt)) {
      if ($read(joblist.txt,%i) isin %tmp) {
        set %jobs $remove(%tmp,td,>,<,/,	)
      }
      inc %i
    }
  }
  if (%idsearch.count == 1) {
    timeoutoff
    var %k 1
    while (%k <= $lines(tmp_itm.txt)) {
      var %result = %result $+ $chr(44) $+ $rvnum($read(tmp_itm.txt,%k)) | inc %k
    }
    var %itmresult = $mid(%result,2)
    if (!%idsearch.memo) { set %idsearch.memo 없음 }
    if (!%itmresult) { var %itmresult 4아이템을 착용하지 않았거나 로그인을 하지 않아 아이템 정보가 갱신되지 않은 아이디입니다. }
    var %idsearch.call $remove($josa(%idsearch.id,은는),%idsearch.id)
    var %idsearch.home %idsearch.id
    if ($readini(b-title.ini,서버,%idsearch.id) == %idsearch.server) { set %itmresult $readini(b-title.ini,아이템,%idsearch.id) }
    if ($readini(b-title.ini,랭킹,%idsearch.id)) {
      if ($readini(b-title.ini,풀네임,%idsearch.id) == 1) {
        if (%idsearch.server = $readini(b-title.ini,서버,%idsearch.id)) {
          set %idsearch.id %idsearch.id / 칭호 : $readini(b-title.ini,랭킹,%idsearch.id)
        }
      }
    }
    privmsg %idsearch.chan 아이디 :  $+ %idsearch.id $+  / 서버 : %idsearch.server / 직업 : %jobs $+ ( $+ %idsearch.sex $+ )  / 호패주소 : http://baram.nexon.com/ $+ %idsearch.home $+ $chr(64) $+ %idsearch.server
    privmsg %idsearch.chan 착용한 아이템 : %itmresult
    privmsg %idsearch.chan 최근 호패댓글 - %idsearch.memo
    sockclose $sockname
    unset %idsearch.*
    halt
  }
  if (%idsearch.count == 2) {
    timeoutoff
    privmsg %idsearch.chan $josa(%idsearch.id,은는) %idsearch.server $+ 서버에 존재하는 아이디가 아닙니다. (사용문의 : #Zod or 얼음의도시@유리)
    sockclose $sockname
    unset %idsearch.*
  }
  if (%idsearch.count == 6) {
    timeoutoff
    privmsg %idsearch.chan 해당 아이디를 검색 중에 참조가 잘못되어 오류가 발생하였습니다. (사용문의 : #Zod or 얼음의도시@유리)
    sockclose $sockname
    unset %idsearch.*
  }
  if (%idsearch.count == 5) {
    timeoutoff
    privmsg %idsearch.chan 현재 바람의나라 홈페이지가 점검중입니다. 사용이 불가능합니다. (사용문의 : #Zod or 얼음의도시@유리)
    sockclose $sockname
    unset %idsearch.*
  }
  if (%idsearch.count == 8) {
    timeoutoff
    privmsg %idsearch.chan 해당 아이디를 찾을 수 없습니다. 아이디 생성후 한번도 접속하지 않았거나 존재하지 않는 아이디입니다. (사용문의 : #Zod or 얼음의도시@유리)
    sockclose $sockname
    unset %idsearch.*
  }
  if (%idsearch.count == 9) {
    timeoutoff
    privmsg %idsearch.chan 넥슨 서버 시스템 장애로 정상적인 서비스가 이루어 지고 있지 않습니다. (사용문의 : #Zod or 얼음의도시@유리)
    sockclose $sockname
    unset %idsearch.*
  }
  if (%searchword isin %tmp) { set %idsearch.count 1 }
  if (%searchword2 isin %tmp) { set %idsearch.count 2 }
  if (%searchword3 isin %tmp) { set %idsearch.count 3 }
  if (%searchword4 isin %tmp) { set %idsearch.count 4 }
  if (%errormode isin %tmp) { set %idsearch.count 5 }
  if (%errormode2 isin %tmp) { set %idsearch.count 6 }
}

on *:sockopen:sleague*: {
  sockwrite -nt $sockname GET /search/player_search.html?winner_value= $+ $urlencode(%sleague.id) $+ &winner_value1= $+ $urlencode(%sleague.id2) $+ &check=etc&x=44&y=16 HTTP/1.1
  sockwrite -nt $sockname User-Agent: Mozilla/4.0
  sockwrite -nt $sockname Host: www.fomos.kr
  sockwrite -nt $sockname Connection: Close
  sockwrite -nt $sockname $crlf
}
on *:sockread:sleague: {
  sockread %tmp
  ; echo -a %tmp
  set %sleague.word1 전&nbsp;&nbsp;<b>
  set %sleague.word2 <td class="eng11" align="center">
  set %sleague.word3 <td class="s_txt" align='center'>
  set %sleague.end <td height="25" colspan="5"></td>

  if (%sleague.word1 isin %tmp && %sleague.cnt == 1) {
    set %sleague.grade $replace($remove(%tmp,<b>,</b>,$chr(9),&nbsp;,<td colspan="3" class="eng11" bgcolor="f7f7f7" style="border-bottom:1px solid #D2D2D2;">,</td>),전,전 $+ $chr(32),승,승 $+ $chr(32),패,패 $+ $chr(44) 통산승률 : ,:,: $+ $chr(32))
    set %sleague.cnt 2
    set %sleague.count 77
  }

  if (%sleague.count == 22) { writeini sleague.ini %sleague.ocount date $remove(%tmp,$chr(9),</td>) | set %sleague.count 77 }

  if (%sleague.count == 33) {
    if (%sleague.icount == 5) { writeini sleague.ini %sleague.ocount map $remove(%tmp,$chr(9),</td>) | inc %sleague.ocount | set %sleague.icount 7 }
    if (%sleague.icount == 4) { writeini sleague.ini %sleague.ocount lbrood $remove(%tmp,$chr(9),</td>) | inc %sleague.icount }
    if (%sleague.icount == 3) { writeini sleague.ini %sleague.ocount loser $remove(%tmp,$chr(9),</td>,<b>,</b>) | inc %sleague.icount }
    if (%sleague.icount == 2) { writeini sleague.ini %sleague.ocount wbrood $remove(%tmp,$chr(9),</td>) | inc %sleague.icount }
    if (%sleague.icount == 1) { writeini sleague.ini %sleague.ocount winner $remove(%tmp,$chr(9),</td>,<b>,</b>) | inc %sleague.icount }
    if (%sleague.icount == 7) { set %sleague.icount 1 }
    set %sleague.count 77
  }
  if (%sleague.end isin %tmp) { set %sleague.count 99 }
  if (%sleague.count == 99) {
    timeoutoff
    var %i 1
    while (%i <= $ini(sleague.ini,0)) {
      var %sleague.judge = $iif($readini(sleague.ini,%i,winner) == %sleague.id,$readini(sleague.ini,%i,loser),$readini(sleague.ini,%i,winner))
      var %sleague.bjudge = $iif($readini(sleague.ini,%i,winner) == %sleague.id,$remove($readini(sleague.ini,%i,lbrood),rotoss,erg,erran),$remove($readini(sleague.ini,%i,wbrood),rotoss,erg,erran))

      if (%i <= 5) {
        var %result %result - $iif(%sleague.id == $readini(sleague.ini,%i,winner),12승!1,4패!1) $+ (vs %sleague.judge $+ $chr(91) $+ %sleague.bjudge $+ $chr(93) $+ $chr(44) $readini(sleague.ini,%i,map) $+ $chr(44) $readini(sleague.ini,%i,date) $+ )
      }
      else {
        var %result2 %result2 - $iif(%sleague.id == $readini(sleague.ini,%i,winner),12승!1,4패!1) $+ (vs %sleague.judge $+ $chr(91) $+ %sleague.bjudge $+ $chr(93) $+ $chr(44) $readini(sleague.ini,%i,map) $+ $chr(44) $readini(sleague.ini,%i,date) $+ )
      }
      inc %i
    }
    if (%sleague.id3 == vs) { unset %sleague.id3 }
    if (!$ini(sleague.ini,0)) { privmsg %sleague.chan 4[!]1 %sleague.id %sleague.id3 $+ 선수의 최근 경기 전적을 찾을수 없습니다. }
    else {
      privmsg %sleague.chan 12 $+ %sleague.id %sleague.id3 $+ 1선수의 최근 $ini(sleague.ini,0) $+ 경기전적은 다음과 같습니다. ( $+ %sleague.grade $+ )
      privmsg %sleague.chan $mid(%result,2)
      if (%result2) { privmsg %sleague.chan $mid(%result2,2) }
    }
    if ($exists(sleague.ini)) { remove sleague.ini }
    unset %sleague.*
    sockclose $sockname
  }
  if (%sleague.word2 isin %tmp) { set %sleague.count 22 }
  if (%sleague.word3 isin %tmp) { set %sleague.count 33 }  
}
on *:text:*:#: {
  if (($me isin $1-) && (%botnick isin $1-) && ($nick(#,$rand(5,$nick(#,0))) isin $1-)) {
    if ($nick != ^^ && $nick != $me && $nick != %botnick && $readini(call_except.ini,ip,$address($nick,2)) != 1) {
      sockwrite -tn Zodbot mode $chan +b $address($nick,2)
      sockwrite -tn Zodbot kick $chan $nick 전체호출하지마_씨방새야
    }
  }
  if ($me isin $1- && $nick != %botnick && $nick != ^^) {
    /window -m @호출
    /aline @호출 14┌─────────────────────────────────━━
    /aline @호출 14│시간 : $asctime(hh시 nn분 ss초)
    /aline @호출 14│채널 : $chan
    /aline @호출 14│호출한 사람 : $nick
    /aline @호출 14│내용 : $strip($1-)
    /aline @호출 14└─────────────────────────────────━━ 
    halt
  }
}
on *:JOIN:*: {
  if (($readini(banlist.ini,ipban,$address($nick,2)) == 1) || ($readini(banlist.ini,nickban,$nick) == 1)) {
    writeini banlist.ini nickban $nick 1
    writeini banlist.ini ipban $address($nick,2) 1
    sockwrite -tn Zodbot mode $chan -ov $nick $nick
    sockwrite -tn Zodbot mode $chan +b $address($nick,2)
    sockwrite -tn Zodbot kick $chan $nick Giving_power_from_the_Zod.
    halt
  }  
  var %i 1
  while (%i <= $ini(banlist.ini,ipban,0)) {
    if ($ini(banlist.ini,ipban,%i) iswm $address($nick,5)) {
      writeini banlist.ini nickban $nick 1
      writeini banlist.ini ipban $address($nick,2) 1
      sockwrite -tn Zodbot mode $chan -ov $nick $nick
      sockwrite -tn Zodbot mode $chan +b $address($nick,2)
      sockwrite -tn Zodbot kick $chan $nick Giving_power_from_the_Zod.
    }
    inc %i
  }
  if ($address($nick,2) == %fuckup.ip || $nick == %fuckup.nick) {
    if (%fuckup.count2 >= %fuckup.count) {
      unset %fuckup.*
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 4완전한 게이로 만들었다.
      halt
    }
    elseif (%fuckup.count2 < %fuckup.count) {
      inc %fuckup.count2
      kick $chan $nick %fuckup.count2 $+ 회째_스핀
      ; msg ^^ 킥 $chan $nick %fuckup.count2 $+ 회째_스핀
    }
  }
  if ($nick == %botnick) {
    if ($me ison $chan) {
      if (%botnick !isop $chan) {
        .mode $chan +ov %botnick %botnick
        .mode #Bot-HQ +snk 0998
        halt
      }
      halt
    }
  }
  ; 조인시 5초간 모든 메시지를 ignore하여 웜에 대한 예방 (최초 1회만 실행)
  if ($nick == $me) {
    if (%igc == 1) {
      ignore *!*@*
      set %igc 0 | .timer98 1 5 ignore -r *!*@* | .timer99 1 5 .notice $me 주인님의 5초 이그노어를 해제하겠습니다. | halt
    }
  }  ; $me가 #Zod 채널에 입장시 $me라면
  ;  디보이스 목록
}
on *:OP:#: {
  ; 봇이 옵을 받았을때 이벤트
  if ($opnick == %botnick) {
    if ($nick == $me) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 주인님 아니 뭐 이런걸 다...
      halt
    }
    if ($nick != ^^) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ olleh~!!
      halt
    }
    ; $me가 옵이 없다면 옵을 주려고 시도한다.
    if ($me !isop $chan) {
      sockwrite -tn Zodbot mode $chan +ov $me $me
    }
    halt
  }
  ; $me가 옵을 받았을때 봇에게 옵이 없다면 주려고 시도한다.
  if ($opnick == $me) {
    if (%botnick ison $chan) {
      if (%botnick !isop $chan) {
        mode $chan +ov %botnick %botnick
        halt
      }
    }
  }
  ; 옵을 받은사람이 @옵뺏어 명령으로 디옵이 지정된 사람이면 바로 옵을 뺏는다.
  if ($opnick == %deopper) { sockwrite -nt Zodbot mode $chan -ov %deopper %deopper | halt }
  if ($address($opnick,2) iswm %deopad) { sockwrite -nt Zodbot mode $chan -ov %deopper %deopper | halt }
}
on *:VOICE:#: {
  if ($vnick == %deopper) { sockwrite -nt Zodbot mode $chan -ov %deopper %deopper | halt }
  if ($address($vnick,2) iswm %deopad) { sockwrite -nt Zodbot mode $chan -ov %deopper %deopper | halt }
}
; 디옵시 발생하는 이벤트
on *:DEOP:#: {
  if (($nick == $me)) && (($opnick == %botnick)) {
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 주인님 미워~!!
    halt
  } 
  ; 봇이나 $me 둘중에 하나가 옵을 뺏기게 되면 뺏은 사람을 kick한후에 빵글이 킥을 하거나 직접 킥을 한후 다시 뺏긴 옵을 서로가 부여한다.
  if ($opnick == %botnick) {
    if ($nick == %botnick) {
      halt
    }
    if ($nick != ^^) {
      if (^^ ison $chan) {
        msg ^^ 디옵 $chan $nick
        msg ^^ 킥 $chan $nick 옵뺏지마요!!낄낄~
        msg ^^ 옵 $chan $me
        halt
      }
      else {
        set %chanchan #
        if (%botnick isop $chan) { sockwrite -nt Zodbot mode $chan -ov $nick $nick | halt }
      }
    }
    else {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 그리고 그는 파란막장한 인생의 길을 걷게 되었다...
      if (($nick != $me) && ($nick != %botnick)) {
        .kick $chan $nick It's My Revenge!!
      }
      .mode $chan +ov %botnick %botnick
      halt
    }
  }
  if ($opnick == $me ) {
    if ($nick == $me) {
      halt
    }
    if ($nick != ^^) {
      if (^^ ison $chan) {
        msg ^^ 디옵 $chan $nick
        msg ^^ 킥 $chan $nick 옵뺏지마요!!낄낄~
        msg ^^ 옵 $chan $me
      }
      set %chanchan #
      if (%botnick isop $chan) { sockwrite -nt Zodbot mode $chan -ov $nick $nick }
    }
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 그리고 그는 파란막장한 인생의 길을 걷게 되었다...
  }
  if ($nick == %botnick) {
    sockwrite -nt Zodbot mode %chanchan +ov $me $me
    halt
  }
  if (%botnick isop $chan) { sockwrite -nt Zodbot mode $chan +ov $me $me }
  halt
}
on *:Kick:#: { 
  if ($knick == %botnick || $knick == $me) {
    set %kickchan $chan
    writeini banlist.ini nickban $nick 1
    writeini banlist.ini ipban $address($nick,2) 1
    writeini caction.ini 영구블랙 $address($nick,2) 1
    if ($nick != $me) {
      msg ^^ 킥 $chan $nick It's My Revenge!!
      .kick $chan $nick It's My Revenge!!
      halt
    }
    sockwrite -tn Zodbot join %kickchan
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 그리고 그는 파란막장한 인생의 길을 걷게 되었다...
    .mode $chan +ov %botnick %botnick
    unset %kickchan
    halt
  }
}
; #Zod의 채널모드를 누군가가 변경시에 원래대로 모드를 바꾼후 디옵한뒤에 5초간 밴을 건다.
on *:mode:*: {
  if ($chan == #Zod) {
    if ($nick != $me) {
      if ($nick != %botnick) {
        if ($nick != ^^) {
          sockwrite -tn Zodbot PRIVMSG $chan : $+ 채널모드를 건드리지 마십시요. ( $+ 채널모드 변경 사항 : $1- $+ )
          sockwrite -nt Zodbot mode $chan $replace($1,+,$!chr(45),-,$!chr(43),$!chr(45),-,$!chr(43),+) $left($2,23)
          sockwrite -nt Zodbot mode $chan -o $nick
          sockwrite -nt Zodbot mode $chan +b $address($nick,2)
          timerchanban 1 5 sockwrite -nt Zodbot mode $chan -b $address($nick,2)
        }
      }
    }
  }
  halt
}
; @옵뺏어 명령으로 옵을 빼앗기로 지정된 사용자가 닉을 바꾸면 바꾼 닉을 %deopper에 저장한다.
on *:nick: { if ($nick == %slang.nick) { set %slang.nick $newnick } }
on *:nick: { if ($nick == %spintarget) { set %spintarget $newnick | timermeatspin 0 5 meatspin } }
on *:nick: { if ($nick == %sure.nick) { set %sure.nick $newnick } | if ($nick == %deopper) { set %deopper $newnick | sockwrite -nt Zodbot mode %deopchan -ov %deopper %deopper } }
; 주인만 쓸수있는 명령어
on *:input:*: {
  if (($1 == @닉)) || (($1 == @nick)) && (($2-)) {
    sockwrite -nt Zodbot PRIVMSG ^-^ 닉복구
    set %botnick $2-
    changenick $2-
    halt
  }
  if (($1 == @입장)) || (($1 == @join)) {
    say $read(bot.txt,s,nick) Loading..
    sockwrite -tn Zodbot notice :$read(bot.txt,s,hi) | sockwrite -tn Zodbot join $chan | .sockwrite -nt Zodbot PRIVMSG $chan : $read(bot.txt,s,hi)
    halt
  }
  if (($1 == @퇴장)) || (($1 == @part)) {
    say $read(bot.txt,s,nick) Unloading..
    sockwrite -tn Zodbot part $chan | .sockwrite -nt Zodbot PRIVMSG $chan : $read(bot.txt,s,bye)
    halt
  }
  if (($1 == @재시작)) || (($1 == @restart)) {
    window -c @Zodbot
    sockwrite -tn Zodbot quit :$me 님의 명령으로 재시작을 합니다.
    sockclose Zodbot
    접속체크 서버접속
    halt
  }
  if (($1 == @접속)) || (($1 == @CONNECT)) {
    접속체크 서버접속
    halt
  }
  ; 외부 DLL 필요하니 체크
  if ($1 == @스샷) {
    if (!$2) { 
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 파일명을 지정해주세요.
      halt
    }
    say $1- 　　　　　* 다들 웃으세요 ^-^ *
    mkdir photo 
    var %찰칵 = $mircdirphoto\ $+ $2- $+ .jpg 
    sockwrite -tn Zodbot PRIVMSG $chan : $+ $replace($dll(nScreenShot.dll,Screenshot,%찰칵),S_OK,현재 화면을 $2- $+ .jpg 로 저장하였습니다.) 
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 현재 스샷폴더에는 : $findfile($mircdirphoto,*,0) $+ 개의 파일이 저장되어 있습니다.
    halt 
  }
  if (($1 == @종료)) || (($1 == @quit)) {
    window -c @Zodbot
    sockwrite -tn Zodbot quit :주인님의 명령으로 종료합니다. 좋은 하루되세요.
    sockclose Zodbot
    halt
  }
  ; /hop 과 같은 기능
  if ($1 == @리조인) || ($1 == @rejoin) {
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 앗~ 주인님~ 다시 접속하겠습니다. | Zodbotrejoin $chan
    halt
  }
  ; 자동조인 기능
  if ($1 == @자동조인) || ($1 == @autojoin) {
    say $1-
    if (($chan isin %bot.autojoin)) { 접속체크 sockwrite -tn Zodbot PRIVMSG $chan :이미 등록돼어있는 채널입니다. 확인해주세요. [채널: $gettok(%Zodbot.data,3,32) $+ ] | halt }
    autojoinadd $chan
    myautojoinadd
    halt
  }
  if ($1 == @채널삭제) || ($1 == @delautojoin) {
    if (($chan !isin %bot.autojoin)) { 접속체크 sockwrite -tn Zodbot PRIVMSG $chan :미등록 채널입니다. 확인해주세요. [채널 : $chan $+ ] | halt }
    autojoindel $chan
    myautojoindel
    halt
  }
  if ($1 == @미트스핀) {
    say $1-
    if ($2 == 취소) {
      sockwrite -tn Zodbot PRIVMSG %spinchan : $+ Spinning Terminated.
      timermeatspin off
      unset %spintarget
      unset %spinchan
      unset %spin 0
      set %spinactivate off
      halt
    }
    if ($2 != 취소 && %spinactivate == on) { privmsg $chan You are already spinning with %spintarget | halt }
    set %spintarget $2
    set %spinchan $chan
    set %spin 0
    set %spinactivate on
    privmsg $chan Start the meatspin with %spintarget $+ !!
    timermeatspin 0 5 meatspin
    halt
  }
  if ($1 == @방법) {
    say $1-
    if (!$2) { sockwrite -tn Zodbot PRIVMSG $chan : $+ 호구가 필요하다. Usage : @방법 호구이름 방법횟수 | halt }
    if (!$3) { sockwrite -tn Zodbot PRIVMSG $chan : $+ 횟수가 필요하다. Usage : @방법 호구이름 방법횟수 | halt }
    if ($2 !ison $chan) { sockwrite -tn Zodbot PRIVMSG $chan : $+ 그런 호구는 존재하지 않는다. | halt }
    if ($3 !isnum) { sockwrite -tn Zodbot PRIVMSG $chan : $+ 올바른 숫자가 필요하다. | halt }
    unset %fuckup.*
    set %fuckup.nick $2
    set %fuckup.ip $address($2,2)
    set %fuckup.count $3
    set %fuckup.count2 1
    kick $chan %fuckup.nick %fuckup.count2 $+ 회째_스핀
    ; msg ^^ 킥 $chan %fuckup.nick %fuckup.count2 $+ 회째_스핀
    halt
  }
  if ($1 == @전체설호) {
    if ($nick($chan,0) > 60) { sockwrite -tn Zodbot PRIVMSG $chan :인간이 너무 많다. 처리하기가 귀찮으니 니가 직접 타이핑해라. | halt }
    var %i 0
    while (%i <= $nick($chan,0)) {
      inc %i
      var %allcall %allcall $+ $chr(44) $nick($chan,%i)
    }
    sockwrite -tn Zodbot PRIVMSG $chan : $+ $mid($remove(%allcall,^^,%botnick,$me,$chr(44) $chr(44) $chr(44),$chr(44) $chr(44)),2) $+ 횽,눈하들 좀 설레이나혀? ㅍ;;
  }
  if ($1 == @전태양) {
    if ($nick($chan,0) > 60) { sockwrite -tn Zodbot PRIVMSG $chan :인간이 너무 많다. 처리하기가 귀찮으니 니가 직접 타이핑해라. | halt }
    var %i 0
    while (%i <= $nick($chan,0)) {
      inc %i
      if (%i <= 30) { var %allcall %allcall $+ $chr(44) $nick($chan,%i) }
      else { var %allcall2 %allcall2 $+ $chr(44) $nick($chan,%i) | var %call2 1 }
    }
    sockwrite -tn Zodbot PRIVMSG $chan : 8 $+ $mid($remove(%allcall,^^,%botnick,$me,$chr(44) $chr(44) $chr(44),$chr(44) $chr(44)),2) $+ 횽,눈하들 좀 설레이나혀? ㅍ;;
    if (%call2 == 1) {
      sockwrite -tn Zodbot PRIVMSG $chan : 8 $+ $mid($remove(%allcall2,^^,%botnick,$me,$chr(44) $chr(44) $chr(44),$chr(44) $chr(44)),2) $+ 횽,눈하들 좀 설레이나혀? ㅍ;;
    }
  }
  ; 자동조인 리스트
  if ($1 == @리스트) || ($1 == @list) {
    autojoinlist $chan
    halt
  }
  if ($1 == @말) || ($1 == @talk) && (($2)) && (($3-)) {
    say $1-
    set %talk #$2
    sockwrite -tn Zodbot PRIVMSG %talk : $+ $3-
    unset %talk
    halt
  }
  if ($1 == @비상) {
    say $1-
    sockwrite -nt Zodbot part %bot.autojoin
    sockwrite -nt Zodbot join #Bot-HQ 0998
    halt
  }
  if ($1 == @점검) {
    say $1-
    nick %esrever $+ ^봇점검
    changenick %botnick $+ ^점검중
    set %botnick %botnick $+ ^점검중
    sockwrite -tn Zodbot PRIVMSG %bot.autojoin : $+ 점검모드로 들어갑니다.
    writeini -n cmdlimit.ini 전체 점검 1
    write -ds status bot.txt
    write bot.txt status 봇점검
    halt
  }
  if ($1 == @점검해제) {
    say $1-
    nick %esrever
    sockwrite -tn Zodbot PRIVMSG %bot.autojoin : $+ 점검모드를 해제합니다.
    writeini -n cmdlimit.ini 전체 점검 2
    write -ds status bot.txt
    changenick Zod
    set %botnick Zod
    write bot.txt status 잠수
    halt
  }
  if ($1 == @비상해제) {
    접속체크    sockwrite -tn Zodbot PRIVMSG $chan : $+ 자동조인이 설정된 채널로 다시 복귀하겠습니다. | sockwrite -nt Zodbot join %bot.autojoin | sockwrite -nt Zodbot join #Bot-HQ 0999
    sockwrite -nt Zodbot join #Zod
    set %activatebot off
    timeractivatebot 1 60 activatebot
    halt
  }
  if (($1 == @옵뺏어)) || (($1 == @deop2)) && (($2)) && (($3)) {
    set %deopper $3-
    set %deopchan #$2
    set %deopad $address($3,2)
    접속체크    sockwrite -tn Zodbot PRIVMSG %deopchan : $+ 주인님의 명령으로 %deopchan $+ 채널에서 %deopper $+ 님의 옵을 회수하겠습니다. | sockwrite -nt Zodbot mode %deopchan -o %deopper | sockwrite -tn Zodbot PRIVMSG $chan : $+ %deopchan $+ 채널에서 %deopper $+ 님이 소유한 옵을 회수하였습니다.
    halt
  }
  if (($1 == @옵복구)) || (($1 == @deop2)) && (($2)) && (($3)) {
    접속체크    sockwrite -tn Zodbot PRIVMSG %deopchan : $+ 주인님의 명령으로 %deopchan $+ 채널에서 %deopper $+ 님의 옵을 복구하겠습니다. | sockwrite -nt Zodbot mode %deopchan +o %deopper | sockwrite -tn Zodbot PRIVMSG $chan : $+ %deopchan $+ 채널에서 %deopper $+ 님이 소유한 옵을 복구하였습니다.
    unset %deopchan
    unset %deopper
    halt
  }
  if (($1 == @@) || ($1 == @올옵)) {
    say $1-
    if (%botnick !isop $chan) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 옵고쿠 : "지구인들이여, 나에게 옵을 조금씩만 나누어줘!!"
      halt
    }
    set %opchan $chan
    접속체크
    옴마니밤메홈
    alop
    unset %opchan
    halt
  }
  if ($1 == @자반추가) {
    if (!$2) { sockwrite -tn Zodbot PRIVMSG $chan : $+ 자동반응할 단어를 설정하여 주세요. | halt }
    if (!$3) { sockwrite -tn Zodbot PRIVMSG $chan : $+ $2 $+ 의 내용을 입력해주세요. | halt }
    var %desc $3-
    var %i 0
    while (%i <= $nick($chan,0)) {
      inc %i
      var %desc $replace(%desc,$nick($chan,%i),$nickdt($nick($chan,%i)))
    }
    .writeini automsg.ini $2 1 %desc , 낚은채널 : $masking($chan) , 낚은날 : $asctime(yyyy) $+ 년 $asctime(mm) $+ 월 $asctime(dd) $+ 일 $asctime(TT hh:nn:ss) $+ 경에 낚았습니다.
    sockwrite -tn Zodbot PRIVMSG $chan : $+ $josa($2,을를) 자동반응 리스트에 추가하였습니다.
    halt
  }
  if ($1 == @사용자) {
    var %i 1
    while (%i <= $ini(tracking.ini,time,0)) {
      var %zuser %zuser $+ $chr(44) $ini(tracking.ini,time,%i) ( $+ $readini(tracking.ini,count,$ini(tracking.ini,time,%i)) $+ $chr(44) $readini(tracking.ini,time,$ini(tracking.ini,time,%i)) $+ $chr(44) $readini(tracking.ini,nick,$ini(tracking.ini,time,%i)) $+ )
      inc %i
    }
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 현재 사용자 목록 : $mid(%zuser,3)
  }
  if ( $1- == !raw on ) {
    set %useraw 1
  } 
  elseif ( $1- == !raw off ) {
    unset %useraw
  }
  if ($left($1,1) != /) && ($left($1,1) != @) {
    if ((%color.시스템 == 실행 || %color.말꼬리 == 실행 || %color.리버스 == 실행 || %color.풀어쓰기 == 실행 || %color.말머리 == 실행 || %color.외계어 == 실행 || %color.ren == 실행 || %color.j == 실행 || %color.bold == 실행 ) && ($1 != $null)) {
      var %color.sa $1- 
      set %color.st $1- 
      if (%color.외계어 == 실행) {
        uin
        var %color.sa %color.st
      }
      if (%color.시스템 == 실행) {
      var %color.sa  $+ %color.색 $+ %color.sa }
      if (%color.ren == 실행) {
        %color.색 =  $+ $replace($rand(2,15),8,4,9,10,11,14)
        if (%color.rend <= 9) {
          set %color.sa  $+ 0 $+ %color.rend $+ %color.sa
        }
      }
      if (%color.j == 실행) {
        var %color.sa  $+ %color.sa
      }
      if (%color.bold == 실행) {
        var %color.sa  $+ %color.sa $+ 
      }
      if (%color.말머리 == 실행) {
        var %color.sa %co.말머리 %color.sa
      }
      if (%color.말꼬리 == 실행) {
        var %color.sa %color.sa %co.말꼬리
      }
      if (%color.리버스 == 실행) {
        var %color.sa $reverse($1-,$1-)
        ; var %color.sa $reverse(%color.sa,%color.sa)
      }
      if (%color.풀어쓰기 == 실행) {
        var %color.sa $dll(hangul.dll,split,$1)
      }
      say %color.sa
      ;      unset %color.st
      halt
    }
  }
  if ($strip($1) == @컬러) { say $1- | 컬러 $2- | halt }
  if ($strip($1) == @랜덤) { say $1- | 랜덤 | halt }
  if ($strip($1) == @밑줄) { say $1- | 밑줄 | halt }
  if ($strip($1) == @볼드) { say $1- | 볼드 | halt }
  if ($strip($1) == @외계어) { say $1- | 외계어 | halt }
  if ($strip($1) == @말머리) { say $1- | 말머리 $2- | halt }
  if ($strip($1) == @말꼬리) { say $1- | 말꼬리 $2- | halt }
  if ($strip($1) == @리버스) { say $1- | 리버스 $2- | halt }
  if ($strip($1) == @풀어스기) { say $1- | 풀어쓰기 $2- | halt }
  if ($strip($1) == @다끔) { say $1- | 다끔 | halt }
  ; 지혼자 떠드는 기능
  if ($1 == @수다) || ($1 == @chat) {
    접속체크    sockwrite -tn Zodbot PRIVMSG $chan : $+ 수다기능을 켭니다. | .timer1 0 20 chatc
    halt
  }
  if ($1 == @욕배틀) {
    say $1-
    if (%slang == off) {
      if ($2- != $null) {
        set %slang on
        set %slang.nick $2-
        sockwrite -tn Zodbot PRIVMSG $chan : $+ 욕배틀 기능을 시작한다. 이제 나의 엄청난 랩같은 욕지거리를 들려주마
        halt
      }
      if ($2- == $null) {
        sockwrite -tn Zodbot PRIVMSG $chan : $+ 욕을 하려는 상대가 없습니다.
        halt
      }
    }
    if (%slang == on) {
      if ($2-) {
        set %slang.nick $2-
        sockwrite -tn Zodbot PRIVMSG $chan : $+ 이미 욕콤보 기능이 작동중 (with %slang.nick $+ )
        halt
      }
      else {
        set %slang off
        sockwrite -tn Zodbot PRIVMSG $chan : $+ %slang.nick $+ 님과의 욕배틀을 그만둡니다.
        unset %slang.nick
        halt
      }
    }
    halt
  }
  ; 수다기능을 멈출때
  if ($1 == @닥쳐) || ($1 == @shut) {
    say $1-
    접속체크    .timer1 off | sockwrite -tn Zodbot PRIVMSG $chan : $+ 수다기능을 끕니다.
    halt
  }
  if ($1 == @조교추가) {
    say $1-
    if (!$2) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ ip를 지정하여 주십시요.
      halt
    }
    writeini tstatus.ini *!*@ $+ $2 멍때리다 1
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 해당 ip에 권한의 추가가 완료되었습니다.
    halt
  }
  if ($1 == @인증추가) {
    say $1-
    if (!$2) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 사용자를 지정하여 주십시요.
      halt
    }
    msg ^^ 사용자추가 #Zod $2 400
    msg ^^ 사용자수정 #Zod 자동 $2 옵
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 인증사용자인 $2 $+ 님을 #Zod채널의 인증자로 설정하였습니다.
    halt
  }
  if ($1 == @권한추가) {
    say $1-
    if (!$2) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 사용자를 지정하여 주십시요.
      halt
    }
    writeini bigfile.ini ip *!*@ $+ $2 1
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 해당 ip에 빅파이 권한부여가 완료되었습니다.
    halt
  }
  ; 10진수를 n진수로 변환할 때 쓴다. usage : @정수 1234 16 (1234(10)를 16진수로 변환)
  if ($strip($1) == @정수) {
    clear
    var %i $2
    var %radix 0
    echo -a $2
    while (%i >= 1) {
      echo -a $int($calc(%i / $3)) + $replace($calc(%i % $3),10,A,11,B,12,C,13,D,14,E,15,F)
      var %i $int($calc(%i / $3))
    }
  }
  ; n진수를 10진수로 변환할 때 쓴다. usage : @정수2 10111111001 2 (10111111001(2)를 10진수로 변환)
  if ($strip($1) == @정수2) {
    clear
    var %rev $reverse($2)
    var %i 0
    while (%i <= $calc($len(%rev) - 1)) {
      if ($mid(%rev,$calc(%i + 1),1) != 0) {
        var %result $3 $+ ^ $+ %i x $mid(%rev,$calc(%i + 1),1) + %result
        var %result2 $calc(($3^%i * $mid(%rev,$calc(%i + 1),1))) + %result2
        var %result3 $calc(%result3 + ($3^%i * $mid(%rev,$calc(%i + 1),1)))
      }
      inc %i
    }
    echo -a %result
    echo -a %result2
    echo -a %result3
  }
  if ($strip($1) == @펼쳐쓰기) {
    ; 해결해야 할 펼쳐쓰기 문제ㅝ ㅞ  ㅟ ㅢ  ㅚ ㅙ ㅘ
    if ($exists(expander.ini)) { .remove expander.ini }
    var %color.sa $2-
    var %i 1
    set %j 1
    while (%i <= $len(%color.sa)) {
      var %color.tmp $dll(hangul.dll,split,$mid(%color.sa,%i,2))
      var %color.1st $mid(%color.tmp,1,2)
      var %color.2nd $replace($mid(%color.tmp,3,2),ㅚ,ㅗㅣ,ㅝ,ㅜㅓ,ㅞ,ㅜㅔ,ㅟ,ㅜㅣ,ㅙ,ㅗㅐ,ㅘ,ㅗㅏ,ㅢ,ㅡㅣ)
      var %color.3rd $mid(%color.tmp,5,2)
      if (!%color.1st) { var %color.1st 0ll }
      if (!%color.2nd) { var %color.2nd 0ll }
      if (!%color.3rd) { var %color.3rd 0ll }
      writeini expander.ini 초성 %j %color.1st
      writeini expander.ini 중성 %j %color.2nd
      writeini expander.ini 종성 %j %color.3rd
      inc %i
      inc %i
      inc %j
    }
    if ($readini(expander.ini,중성,1) == ㅗ || $readini(expander.ini,중성,1) == ㅛ || $readini(expander.ini,중성,1) == ㅜ || $readini(expander.ini,중성,1) == ㅠ || $readini(expander.ini,중성,1) == ㅡ) {
      var %color.result2 0l1
    }
    var %i 1
    while (%i < %j) {
      var %color.result1 %color.result1 $+ $readini(expander.ini,초성,%i) $+ 0ll1
      if ($readini(expander.ini,중성,%i) == ㅜㅓ || $readini(expander.ini,중성,%i) == ㅗㅣ || $readini(expander.ini,중성,%i) == ㅜㅔ || $readini(expander.ini,중성,%i) == ㅜㅣ || $readini(expander.ini,중성,%i) == ㅡㅣ || $readini(expander.ini,중성,%i) == ㅗㅣ || $readini(expander.ini,중성,%i) == ㅗㅐ || $readini(expander.ini,중성,%i) == ㅗㅏ) {
        var %color.result1 %color.result1 $+ $remove($readini(expander.ini,중성,%i),ㅜ,ㅗ,ㅡ)
        var %color.result2 %color.result2 $+ 0ll1 $+ $remove($readini(expander.ini,중성,%i),ㅓ,ㅔ,ㅣ,ㅐ,ㅏ)
        var %color.result3 %color.result3 $+ 0ll1 $+ $readini(expander.ini,종성,%i)
      }
      else {
        if ($readini(expander.ini,중성,%i) == ㅏ || $readini(expander.ini,중성,%i) == ㅑ || $readini(expander.ini,중성,%i) == ㅓ || $readini(expander.ini,중성,%i) == ㅕ || $readini(expander.ini,중성,%i) == ㅣ || $readini(expander.ini,중성,%i) == ㅔ || $readini(expander.ini,중성,%i) == ㅐ || $readini(expander.ini,중성,%i) == ㅒ || $readini(expander.ini,중성,%i) == ㅖ) {
          var %color.result1 %color.result1 $+ $readini(expander.ini,중성,%i) $+ 0ll1
          var %color.result2 %color.result2 0llll1 $+ $readini(expander.ini,종성,%i) $+ 0lll1
          var %color.result3 %color.result3 $+ 0llll
          var %color.adder 1
        }
        if ($readini(expander.ini,중성,%i) == ㅗ || $readini(expander.ini,중성,%i) == ㅛ || $readini(expander.ini,중성,%i) == ㅜ || $readini(expander.ini,중성,%i) == ㅠ || $readini(expander.ini,중성,%i) == ㅡ) {
          if (%color.adder == 1) {
            var %color.result2 %color.result2 $+ 0lll1 $+ $readini(expander.ini,중성,%i) $+ 0ll1
            var %color.adder 2
          }
          else {
            var %color.result2 %color.result2 $+ $readini(expander.ini,중성,%i) 0ll1
          }
          var %color.result3 %color.result3 $+ $readini(expander.ini,종성,%i) $+ 0ll1
        }
      }
      inc %i
    }
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 0l1 $+ %color.result1
    sockwrite -tn Zodbot PRIVMSG $chan : $+ %color.result2
    sockwrite -tn Zodbot PRIVMSG $chan : $+ %color.result3
    halt
  }  
  if ($strip($1) == @폭파) {
    say $1-
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 폭파시킬 계정을 입력하여 주십시요.
      halt
    }
    remini -n tmp_exp.ini 돈 $2
    sockwrite -nt Zodbot PRIVMSG $chan : $+ $nickdt($2) $+ 계정의 초기화가 완료되었습니다.
    halt
  }
  if ($strip($1) == @블랙추가) {
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 블랙리스트에 추가할 이름을 입력하여 주십시요.
      halt
    }
    if ($2 == 채널블랙) {
      if (!$3) {
        sockwrite -nt Zodbot PRIVMSG $chan : $+ 블랙리스트에 추가할 채널을 입력하여 주십시요.
        halt
      }
      var %i 0
      while (%i <= $nick(#$3,0)) {
        if ($address($nick(#$3,%i),2) == $address($me,2)) { inc %i }
        else { write black.txt $address($nick(#$3,%i),2) | write black.txt * $+ $nick(#$3,%i) $+ *!*@* | inc %i }
        echo -a %i : $nick(#$3,%i) ( $+ $address($nick(#$3,%i),2) $+ )
        inc %i
      }
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $chan $+ 채널에 접속하였던 모든 인원을 블랙리스트에 추가하였습니다.
      halt
    }
    if ($2 !ison $chan) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $chan $+ 채널에 $2 $+ 님은 안계시는데요?
      halt
    }
    else {
      write black.txt $address($2,2)
      .writeini -n caction.ini 영구블랙 $address($2,2) 1
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $chan $+ 채널에 계시는 $2 $+ 님을 블랙리스트에 추가하였습니다.
      halt
    }
  }
  if ($strip($1) == @블랙채널) {
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 블랙리스트에 추가할 채널을 입력하여 주십시요.
      halt
    }
    else {
      .writeini -n cmdlimit.ini 전체 #$2 1
      sockwrite -nt Zodbot PRIVMSG $chan : $+ #$2 $+ 채널을 블랙리스트에 추가하였습니다.
      halt
    }
  }
  if ($strip($1) == @명령제한) {
    say $1-
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 명령을 제한할 명령어를 선택하여 주십시요.
      halt
    }
    else {
      .writeini -n cmdlimit.ini $2 $chan 1
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 명령을 $chan $+ 채널에서 사용하지 못하도록 설정하였습니다.
      halt
    }
  }
  if ($strip($1) == @메모확인) {
    say $1-
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 현재 남겨진 메모는 $lines(memo.txt) $+ 개 입니다.
      halt
    }
    if (!$read(memo.txt,$2)) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 번째로 남겨진 메모는 없습니다만? 현재 남겨진 메모는 $lines(memo.txt) $+ 개 입니다.
      halt
    }
    else {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 번째에 남겨진 메모는 다음과 같습니다.
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $read(memo.txt,$2)
      halt
    } 
  }
  if ($strip($1) == @관리번호) {
    if (!$2) { sockwrite -nt Zodbot PRIVMSG $chan : $+ 형식 : yyyymmddsss | halt }
    ; sockwrite -nt Zodbot notice $me : $+ $amgine($2)
    sockwrite -nt Zodbot PRIVMSG $chan : $+ $amgine($2)
    halt
  }
  if ($strip($1) == @축복) {
    set %lblessing $3
    set %lblessing_for $2
    if (!$3) { set %lblessing 1 }
    if ($4 != 비밀) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 3주인님께서 $nickdt($2) $+ 님을 친히 축복해주셨습니다. 어서 굽신거리지 못할까! 4(일시적으로 강화 성공확률 90% 증가!!)
    }
    if ($4 == 비밀) {
      echo -a $3 $+ 회간 축복합니다.
    }
    halt 
  }  
  if ($strip($1) == @쿠폰생성) {
    if (!$2) { sockwrite -nt Zodbot PRIVMSG $chan : $+ 형식 : @쿠폰생성 닉 형식 | halt }
    if (!$3) { sockwrite -nt Zodbot PRIVMSG $chan : $+ 형식 : @쿠폰생성 닉 형식 | halt }
    if ($3 == 1) { var %cobonus $rand(1,9) | var %couptype 저가형 }
    if ($3 == 2) { var %cobonus $rand(a,j) | var %couptype 고가형 }
    if ($3 == 3) { var %cobonus z | var %couptype 강화쿠폰 }
    if ($3 == 4) { var %cobonus x | var %couptype 부르마블 }    
    var %lot_time $readini(tmp_exp.ini,당첨,회차)
    if ($len(%lot_time) == 1) { var %lot_time $chr(48) $+ %lot_time }    
    var %coupon_num $asctime(yyyy) $+ %lot_time $+ 11 $+ %cobonus
    var %lcoupon $gettok($gettok($amgine(%coupon_num),5,58),1,47)
    writeini -n tmp_exp.ini 쿠폰 %lcoupon %cobonus
    writeini -n tmp_exp.ini 쿠폰번호 %lcoupon $2
    sockwrite -nt Zodbot PRIVMSG $chan : $+ $nickdt($2) $+ 님의 쿠폰 발급이 완료되었습니다. 생성된 쿠폰번호 : %lcoupon ( $+ %couptype $+ )
  }
  if ($strip($1) == @메모삭제) {
    say $1-
    if (!$2) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 몇번 메모를 삭제하실 것인지 지정하여 주십시요.
      halt
    }
    if (!$read(memo.txt,$2)) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 번째로 남겨진 메모는 없습니다만? 현재 남겨진 메모는 $lines(memo.txt) $+ 개 입니다.
      halt
    }
    if ($2 == 전부) {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ 현재 남겨진 메모를 전부 삭제하겠습니다.
      remove memo.txt
      halt
    }
    else {
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 번째에 있던 메모는 아래와 같으며 삭제를 진행하겠습니다.
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $read(memo.txt,$2)
      write -dl$2 memo.txt
      sockwrite -nt Zodbot PRIVMSG $chan : $+ $2 $+ 번째에 있는 메모를 삭제하였습니다.
      halt
    } 
  }
  if ($1 == @본닉) {
    접속체크
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 본닉으로 수정하겠습니다. | nick %esrever
    write -ds status bot.txt
    write bot.txt status 잠수
    halt
  }
  if ($1 == @외출) {
    접속체크
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 돌아오실때 맛있는거 사오세요~ | nick %esrever $+ ^외출
    write -ds status bot.txt
    write bot.txt status 외출
    halt
  }
  if ($1 == @설계) {
    접속체크
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 주인님 설계열심히 하세요~ | nick %esrever $+ ^설계
    write -ds status bot.txt
    write bot.txt status 설계
    halt
  }
  if ($1 == @트레이) {
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 트레이로 내리겠습니다.
    write -ds status bot.txt
    write bot.txt status 트레이
    /showmirc -t
  }
  if ($1 == @잠수) {
    접속체크
    var %syear $rand(0,100) $+ 년
    var %smonth $rand(0,11) $+ 개월
    var %shour $rand(0,23) $+ 시간
    var %sminute $rand(0,59) $+ 분
    var %ssecond $rand(0,59) $+ 초
    if (%syear == 0년) { var %syear $null }
    if (%smonth == 0개월) { var %smonth $null }
    if (%shour == 0시간) { var %shour $null }
    if (%sminute == 0분) { var %sminute $null }
    if (%ssecond == 0초) { var %ssecond $null }
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 주인님의 예상 잠수시간은 %syear %smonth %shour %sminute %ssecond 입니다.  | nick %esrever $+ ^잠수
    write -ds status bot.txt
    write bot.txt status 잠수
    set %caller off
    halt
  }
  if ($1 == @식사) {
    접속체크
    sockwrite -nt Zodbot PRIVMSG $chan : $+ 주인님 식사 맛있게 하고 오세요~ | nick %esrever $+ ^즐밥
    write -ds status bot.txt
    write bot.txt status 식사
    halt
  }
  if ($1 == @복구) || ($1 == @repair) {
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 타임리미터를 off 값으로 복구하였습니다. | set %tlimiter off | set %tcalc 0 | set %ivflood off | echo -a %tlimiter
    halt
  }
  if ($1 == @사자후) {
    say $1-
    if (!$2) { 
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 내용을 입력하세요.
      halt
    }
    amsg [전체메시지] $2-
    halt
  }
  if ($1 == @조드공지) {
    say $1-
    if (!$2) { 
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 내용을 입력하세요.
      halt
    }
    sockwrite -tn Zodbot PRIVMSG $remove(%bot.autojoin,#프겔,#와우) : $+ [Zod 공지사항] $2-
    halt
  }
  ; 웹사이트 열기
  if ($1 == @웹) {
    say $1-
    if (!$2) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 웹어드레스를 지정하여 주십시요.
      halt
    }
    if ($2 == 빵글이) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 요청하신 웹페이지 ( $+ http://service.hanirc.org $+ )를 열겠습니다. 잠시만 기다리세요. | .run  C:\Program Files\Internet Explorer\iexplore.exe http://service.hanirc.org
      halt
    }
    if ($2 == 블로그) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 요청하신 웹페이지 ( $+ http://xeriars.tistory.com $+ )를 열겠습니다. 잠시만 기다리세요. | .run  C:\Program Files\Internet Explorer\iexplore.exe http://xeriars.tistory.com
      halt
    }
    if ($2 == 참진) {
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 요청하신 웹페이지 ( $+ http://www.charmzine.com $+ )를 열겠습니다. 잠시만 기다리세요. | .run  C:\Program Files\Internet Explorer\iexplore.exe http://www.charmzine.com
      halt
    }
    else {
      if ((http isin $2-) || (www isin $2-))  {
        sockwrite -tn Zodbot PRIVMSG $chan : $+ 요청하신 웹페이지 ( $+ $2- $+ )를 열겠습니다. 잠시만 기다리세요. | .run  C:\Program Files\Internet Explorer\iexplore.exe $2-
        halt
      }
      sockwrite -tn Zodbot PRIVMSG $chan : $+ 요청하신 검색어 ( $+ $2- $+ )의 검색페이지를 표시합니다. 잠시만 기다리세요. | .run  C:\Program Files\Internet Explorer\iexplore.exe $2-
      halt
    }
  }
  if ($1 == @입실) || ($1 == @entrance) && (($2)) {
    sockwrite -tn Zodbot PRIVMSG $chan : $+ #$2 $+ 채널에 입장하겠습니다.  | sockwrite -tn Zodbot join #$2 $3
    halt
  }
  if ($1 == @단군넷) {
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 단군넷에 멀티접속을 시도하겠습니다.
    /server -m irc.dankun.net
    halt
  }
  if ($1 == @쿠폰확률) {
    say $1-
    if (!$2) { sockwrite -tn Zodbot PRIVMSG $chan : $+ “@쿠폰확률 쿠폰코드 1/2”과 같은 형식으로 입력해주세요. | halt }
    if (!$3) { sockwrite -tn Zodbot PRIVMSG $chan : $+ “@쿠폰확률 쿠폰코드 1/2”과 같은 형식으로 입력해주세요. | halt }    
    var %cocode $replace($2,a,천만원증가(훼이크),b,뒷자리삭제,c,뒷자리추가,d,순위바꾸기(위),e,10만원증가,f,50만원증가,g,500만원증가,h,로꾸꺼,i,불우이웃,j,소지금 1~20 $+ $chr(37) $+ 증가,k,순위바꾸기(아래),l,당첨금 / 2~9999 증가)
    var %cocode2 $replace($2,a,1,b,2,c,3,d,4,e,5,f,6,g,7,h,8,i,9,j,10,k,11,l,12)
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 쿠폰코드 : $2 / 구분 : $iif($3 == 1,저가형,고가형) / 쿠폰명 : %cocode / 설정확률 : $iif($3 == 1,$readini(percent.ini,쿠폰,%cocode2),$readini(percent.ini,고급쿠폰,%cocode2)) $+ $chr(37)
    halt
  }
  if ($1 == @퇴실) || ($1 == @entrance) && (($2-)) {
    접속체크    sockwrite -tn Zodbot PRIVMSG $chan : $+ #$2- $+ 채널에서 나가겠습니다.  | sockwrite -tn Zodbot part #$2-
    halt
  }
  if ($1 == @조인) || ($1 == @join) {
    접속체크    sockwrite -tn Zodbot PRIVMSG $chan : $+ #$2 $+ 채널로 조인하겠습니다. | .join #$2 $3
    halt
  }
  if ($1 == @봇정지) {
    say $1-
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 지금부터 봇의 기능을 일시정지 하겠습니다.
    set %activatebot off
    halt
  }
  if ($1 == @호출정지) {
    say $1-
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 지금부터 호출기능을 일시정지 하겠습니다.
    set %caller off
    halt
  }
  if ($1 == @호출시작) {
    say $1-
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 지금부터 일시정지된 호출기능을 활성화 하겠습니다.
    set %caller on
    halt
  }
  if ($1 == @봇시작) {
    say $1-
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 중지된 명령을 이제부터 다시 받아들입니다.
    set %activatebot on
    halt
  }
  if ($1 == @청소) || ($1 == @clear) {
    /clear
    접속체크
    sockwrite -tn Zodbot PRIVMSG $chan : $+ 주인님. $chan $+ 채널의 청소가 완료되었어요.
    halt
  }
  if ($1 == @대청소) || ($1 == @clear) {
    /clearall
    접속체크    sockwrite -tn Zodbot PRIVMSG $chan : $+ 주인님. 모든 채널의 청소를 완료하였습니다.
    halt
  }
  if ($1 == @명령) || ($1 == @bot) && (($2-)) { 
    접속체크    sockwrite -tn Zodbot $2-
    halt
  }
}
alias autocon {
  if ((%botnick !ison #Bot-HQ) && ($network == HanIRC)) {
    notice $me 본부에 Zod가 없음.
    mode #Bot-HQ -sn
    mode #Bot-HQ -k 0998
    서버접속
    timer77 1 10 오토조인봇
    set %tlimiter off
    sockwrite -nt Zodbot PRIVMSG ^-^ 닉복구
  }
  else {
    if (%botnick != Zod) { sockwrite -nt Zodbot PRIVMSG ^-^ 닉복구 }
    set %tlimiter off
    set %slanglimit off
    set %botfeel $replace($rand(1,9),1,젖같음,2,흥분함,3,배고픔,4,즐거움,5,슬픔,6,아픔,7,피곤함,8,두려움,9,보통)
    write -ds lastused bot.txt
    write bot.txt lastused $asctime(HH:nn:ss)
  }
}
alias autochampc {
  set %tlimiter off
  set %ivflood off
  var %i 1
  while (%i <= $ini(amount.ini,사용량,0)) {
    writeini amount.ini 사용량 $ini(amount.ini,사용량,%i) 1
    inc %i
  }
  오토조인봇
  .aline @Zodbot 1*** [ $+ $asctime(TT hh:mm:ss) 접속 유지중..]
}
alias 오토조인봇 {
  .sockwrite -nt Zodbot join %bot.autojoin
}
alias itmsupply {
  var %i 1
  while (%i <= $ini(tstatus.ini,0)) {
    remini -n tstatus.ini $ini(tstatus.ini,%i) 치르노_체력
    remini -n tstatus.ini $ini(tstatus.ini,%i) 레이무_체력
    remini -n tstatus.ini $ini(tstatus.ini,%i) 소악마_체력
    inc %i
  }
  writeini -n tmp_exp.ini 수량제한 1 30
  writeini -n tmp_exp.ini 수량제한 2 10
  writeini -n tmp_exp.ini 수량제한 3 30
  var %j 1
  while (%j <= $ini(tmp_exp.ini,돈,0)) {
    if ( $readini(tmp_exp.ini,돈,$ini(tmp_exp.ini,돈,%j)) <= 10000) {
      remini -n tmp_exp.ini 돈 $ini(tmp_exp.ini,돈,%j)
    }
    inc %j
  }
}
alias wowcommand {
  timeoutoff
  set %wow.prof $dll(utf8.dll,convertlocal,%wow.prof)
  if (%wow.prefix == 羲羲) { unset %wow.prefix }
  if (%wow.prof == 羲羲) { set %wow.prof 11없음 }
  if (%wow.itmc >= 15) { set %wow.itms (아이템은 최대 15개까지만 표시됨) }
  if (%wow.ta1 == $dll(utf8.dll,convertutf8,없음) && %wow.ta2 == $dll(utf8.dll,convertutf8,없음)) { set %wow.talent 해당없음 }
  ; if (%wow.id == 하코다테) { set %wow.desc [얼어붙은 왕좌 (25인)] - 얼음왕관 성채에서 리치 왕 처치 (25인)] }
  privmsg %wow.chan 아이디 :12 %wow.prefix 1 $+ %wow.id / 캐릭터 : %wow.char  / 길드명 : %wow.gn  / 업적 : $comgen(%wow.achp) $+ 점 / 총 완료 : $percent2($gettok(%wow.ach,1,47),$gettok(%wow.ach,2,47),25)
  privmsg %wow.chan 생명력 : $remove(%wow.hp,생명력:) / $gettok(%wow.mp,1,58) : $gettok(%wow.mp,2,58) / 특성 전문화 : %wow.talent / 전문기술 : $mid(%wow.prof,3)
  privmsg %wow.chan 최근업적 : $deltok(%wow.desc,3,93) %wow.time
  privmsg %wow.chan 마지막 업데이트 : $+ $remove(%wow.update,마지막 업데이트:) $+  / 착용중인 아이템 : $remove($mid(%wow.inv,3),羲羲 $+ $chr(44)) %wow.itms
  unset %wow.*
}
alias l_logout {
  var %i 1
  while (%i <= $ini(tmp_exp.ini,돈,0)) {
    if ($readini(tracking.ini,nick,$ini(tmp_exp.ini,돈,%i))) { inc %i }
    else { remini login.ini status | inc %i }
  }
}
alias 서버접속 { .sockclose Zodbot | .sockopen Zodbot $read(bot.txt,s,server) $read(bot.txt,s,port) | .window -a @Zodbot | .aline @Zodbot 1*** 서버접속중.. | echo -a 1[4!1] 서버 접속을 시도중입니다. 잠시만 기다려주세요. } 
Alias 접속체크 {
  if (($file($mircdirbot.txt).size == $null)) { echo -a 설정 에러. 다시 설정해주세요. | halt }
  $1-
}
Alias Zodbotrejoin { sockwrite -tn Zodbot part $1 | sockwrite -tn Zodbot join $1 |  .sockwrite -nt Zodbot PRIVMSG $1 : 주인님. 다시 접속했어요. }
; 채널별 인사가 지정되어 있을시 아래 Alias 실행
Alias chatc { sockwrite -tn Zodbot PRIVMSG $chan : $+ [수다모드] $read(say.txt) }
Alias slangc { sockwrite -tn Zodbot PRIVMSG $chan : $+ $read(slangcombo.txt) }
Alias rchatc { sockwrite -tn Zodbot PRIVMSG %rchat : $+ $read(say.txt) }
Alias chatslang { sockwrite -tn Zodbot PRIVMSG $chan : $+ $read(slangcombo.txt) }
Alias autojoindel {
  var %bot.autojoin2 $1 $+ $chr(44)
  set %bot.autojoin $remove(%bot.autojoin,%bot.autojoin2)
  sockwrite -tn Zodbot PRIVMSG $1 : 현재 채널에 대한 명령이 처리되었습니다. [채널 : $1 $+ ]
  remini prefix.ini $chan
  remini cmdlimit.ini 배수 $chan
  remini cmdlimit.ini 사용량제한 $chan
}
Alias autojoinadd {
  set %bot.autojoin %bot.autojoin $+ $1 $+ $chr(44)
  sockwrite -tn Zodbot PRIVMSG $1 : $+ 현재 채널이 자동접속 목록에 등록 돼었습니다. [채널: $1 $+ ]
  set %actchan $chan
  sockwrite -tn Zodbot PRIVMSG $chan : $+ %actchan $+ 채널에서 %botnir $+ 가 원활한 사용이 되도록 등록중입니다.
  writeini prefix.ini $chan p1 $chr(64)
  writeini prefix.ini $chan p2 $chr(45)
  writeini prefix.ini $chan p3 $chr(33)
  writeini cmdlimit.ini 배수 $chan 1
  writeini cmdlimit.ini 사용량제한 $chan 100
  timer 1 5 sockwrite -tn Zodbot PRIVMSG %actchan : $+ 등록 완료!! 이 채널도 Zod가 접수를 시작하겠습니다. 우걱우걱..
  unset %actchan
}
Alias autojoinlist { sockwrite -tn Zodbot PRIVMSG $1 : 현재 등록된 자동조인 리스트를 출력하겠습니다. | sockwrite -tn Zodbot PRIVMSG $1 : $iif(%bot.autojoin != $null,$replace(%bot.autojoin,$chr(44),$chr(32)),아직 한채널도 등록 안하셨습니다.) }
Alias changenick {  write -ds nick bot.txt | write bot.txt nick $1 | sockwrite -tn Zodbot nick $read(bot.txt,s,nick) }
Alias 옴마니밤메홈 { sockwrite -tn Zodbot PRIVMSG %opchan : $+ 관심법으로 그대들의 마음을 알아보겠노라.
  sockwrite -tn Zodbot PRIVMSG %opchan : $+ 보인다.. 그대들의 마음이 보인다. 옵을 달라 용을 쓰며 애원하는 그대들의 마음이..
  sockwrite -tn Zodbot PRIVMSG %opchan : $+ 내 그대들을 긍휼히 여겨 친히 옵을 하사토록 하겠노라!
}
alias fnick {
  if ($chr(35) !isin $1) { tokenize 32 # $1- }
  var %ncno = $iif($3 isnum,$3,1), %i = 0
  window -c @ncom | window -hl @ncom
  while (%i < $nick($1,0)) { inc %i | if (($2 isin $nick($1,%i) || $replace($2,-,-,3,З) isin $nick($1,%i)) && $nick($1,%i) != %botnick) { aline @ncom $nick($1,%i) } }
  return $iif($line(@ncom,%ncno),$iif($prop == reverse,$reverse($line(@ncom,%ncno)),$line(@ncom,%ncno)),$!null)
}
alias reverse {
  var %i = 1, %tmp
  while (%i <= $len($1)) { 
    var %n = $iif($asc($mid($1,%i,1)) > 127,2,1), %tmp = $iif($mid($1,%i,%n) == $chr(32),$!chr(32),$v1) $+ %tmp
    inc %i %n
  }
  return $replace(%tmp,$!chr(32),$chr(32))
}
alias urand {
  if ( $calc($iif($2 isnum 10-,$calc($2 + 48),$asc($2)) - $iif($1 isnum 10-,$calc($1 + 48),$asc($1)) + 1) < $4) {
    echo -s error! cannot generate $4 unique characters $+ $iif($4 != 1,s) in the range $1 - $2 $+ .
    return error
  }
  elseif ($4 == $null) {
    echo -s not enough parameters! $urand(v1,v2,C,N)
    return error
  }
  else {
    var %r
    var %x
    var %b $true
    var %i 1
    while (%b) {
      var %r $rand($1,$2)
      while ( $istok(%x,%r,32) ) {
        var %r $rand($1,$2)
      }
      var %x %x %r
      if ($numtok(%x,32) >= $4) {
        var %b $false
      }
      inc %i
    }
    return $replace(%x,$chr(32),$chr($3))
  }
}
alias lotper {
  elseif (%lotsame == 4) {
    set %lotsign 0.2
    set %lotpre 20
  }
  elseif (%lotsame == 5) {
    set %lotsign 0.5
    set %lotpre 50
  }
  elseif (%lotsame == 6) {
    set %lotsign 1
  }
}
Alias alop {
  if (%botnick !isop %opchan) echo -a  0,1 $chan에 옵을 가지고 있지 않습니다.
  else {
    set %i 0
    set %nicks
    set %j 0
    unset %tmp.mop
    :start
    inc %i
    if ($nopnick(%opchan,%i) == $null) {
      if ((%nicks) || (%tmp.mop)) {
        sockwrite -tn Zodbot %tmp.mop %tmp.mop $+ mode %opchan + $+ $str(o,6) %nicks
        unset %nicks %tmp.mop
      }
      else echo -a  0,1 모든 유저가 옵을 가지고 있습니다.
    }
    else {
      set %nicks %nicks $nopnick(%opchan,%i)
      inc %j
      if (%j == 6) {
        sockwrite -tn Zodbot %tmp.mop %tmp.mop $+ mode %opchan + $+ $str(o,6) %nicks $+ $lf
        unset %nicks
      }
      goto start
    }
  }
}
alias dcnewb {
  unset %dcnew.*      
  set %dcnew.id wow_new
  set %dcnew.chan #와우
  set %dcnew.count 1      
  sockclose dcnew
  sockopen dcnew gall.dcinside.com 80
  timeout 3 %dcnew.chan dcnew
}
alias twnew {
  unset %tweet.*      
  set %tweet.id hakodate1
  set %tweet.chan #뽀뽀뽀
  set %tweet.count 1
  var %tweet.check $asc($mid(%tweet.id,%i,1))
  sockclose tweeter2
  sockopen tweeter2 twitter.com 80
  timeout 5 %tweet.chan tweeter2
}
alias blackcheck {
  var %i 1
  while (%i <= $ini(caction.ini,영구블랙,0)) {
    ; echo -a %checkern : $ini(caction.ini,영구블랙,%i)
    if ($ini(caction.ini,영구블랙,%i) iswm $address(%checkern,5)) { halt }
    inc %i
  }
}
alias blackadd {
  var %i 1
  while (%i <= $ini(warning.ini,아이디,0)) {
    if ($ini(warning.ini,아이디,%i) iswm $address(%checkern,5)) {
      privmsg %checkerc $readini(warning.ini,아이디,$ini(warning.ini,아이디,%i))
      remini warning.ini 아이디 $address(%checkern,2)
      writeini -n caction.ini 영구블랙 $address(%checkern,2) 1
      halt
    }
    inc %i
  }
}
Alias 데미지상태 {
  if ((%percent > 0)) && ((%percent < 1)) { set %status 긁힌정도로만 끝나게 }
  elseif (%percent isnum 1-9) { set %status 미약한 상처로만 끝나게 }
  elseif ((%percent > 9)) && ((%percent < 10)) { set %status 미약한 상처로만 끝나게 }
  elseif (%percent isnum 10-19) { set %status 경상을 입게 }
  elseif ((%percent > 19)) && ((%percent < 20)) { set %status 경상을 입게 }
  elseif (%percent isnum 20-29) { set %status 골절상을 입게 }
  elseif ((%percent > 29)) && ((%percent < 30)) { set %status 골절상을 입게 }
  elseif (%percent isnum 30-39) { set %status $rand(1,7) $+ 번 척추가 돌아가게 }
  elseif ((%percent > 39)) && ((%percent < 40)) { set %status $rand(1,7) $+ 번 척추가 돌아가게 }
  elseif (%percent isnum 40-49) { set %status 감각이 없어지게 }
  elseif ((%percent > 49)) && ((%percent < 50)) { set %status 감각이 없어지게 }
  elseif (%percent isnum 50-59) { set %status 반쯤 죽을지경이 }
  elseif ((%percent > 59)) && ((%percent < 60)) { set %status 반쯤 죽을지경이 }
  elseif (%percent isnum 60-69) { set %status 피똥싸는 현상이 일어나게 }
  elseif ((%percent > 69)) && ((%percent < 70)) { set %status 피똥싸는 현상이 일어나게 }
  elseif (%percent isnum 70-79) { set %status 피투성이가 }
  elseif ((%percent > 79)) && ((%percent < 80)) { set %status 피투성이가 }
  elseif (%percent isnum 80-89) { set %status 중환자가 }
  elseif ((%percent > 89)) && ((%percent < 90)) { set %status 중환자가 }
  elseif (%percent isnum 90-99) { set %status 인사불성이 }
  elseif ((%percent > 99)) && ((%percent < 100)) { set %status 인사불성이 }
  elseif ((%percent == 100)) && ((%percent >= 100)) { set %status 영안실로 실려가게 }
  else { set %status 영안실로 실려가게 }
}
Alias gdescriminator {
  if ($1 isnum 0-10) { return 이건 완전히 왠수지간이 만났구먼..ㅉㅉ }
  elseif ($1 isnum 10-20) { return 야.. 걍 깨끗하게 헤어져라. ㅉㅉ }
  elseif ($1 isnum 20-30) { return 니네 원수지간이지?? }
  elseif ($1 isnum 30-40) { return 만나면 싸움뿐.. 웬만하면 만나지 마라. 전쟁이다. }
  elseif ($1 isnum 40-50) { return 멀리하는게 좋겠어요. }
  elseif ($1 isnum 50-60) { return 두분 그냥 아는사이?? }
  elseif ($1 isnum 60-70) { return 두분 친하게 지내세요. }
  elseif ($1 isnum 70-80) { return 연인사이가 아니면 한번 대쉬해보세요. }
  elseif ($1 isnum 80-90) { return 좋은 커플이 만났네요. 예쁜 사랑하세요. }
  elseif ($1 isnum 90-99) { return 두분이서 결혼해도 되겠어요. ^^ }
  else { return Out of Range. 사귀던 말던 계산상 범위 초과니까 알아서. }
}
alias 시간제한 { set %tlimiter off }
alias 응답채널 { unset %rep }
alias 고만좀해 { set %tcalc 0 }
alias calllimiter { set %climiter off }
alias 횟수계산 { set %ccalc 0 }
alias deltag {
  var %delete $1-
  while ( 0 < $regex(html,%delete,/<(.+?)>/g) ) {
    var %delete $remove(%delete,< $+ $regml(html,1) $+ >)
  }
  return $remove(%delete,$2-,$chr(9),$null)
}
alias lsort {
  if ($exists(lrank.ini)) { .remove lrank.ini }
  if (!$window(@lsorttmp)) { window -hl @lsorttmp }
  loadbuf -t돈 @lsorttmp tmp_exp.ini
  filter -wfa @lsorttmp lrank.ini filter_sort *
  window -c @lsorttmp
  write -l1 lrank.ini [돈]
}
alias filter_sort {
  var %s = $+($deltok($1,1,61),	,$deltok($2,1,61))
  if (%s != $sorttok(%s,9,a)) { return -1 }
  return 1
}
alias lrank {
  %uprank = $calc($ini(lrank.ini,돈,%lppl) - 1)
  %downrank = $calc($ini(lrank.ini,돈,%lppl) + 1)
  if (%uprank == 0) {
    privmsg $gettok(%Zodbot.data,3,32) $ini(lrank.ini,돈,%lppl) $+ 위 :  $nickdt(%lppl) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,%lppl) $+ )
    privmsg $gettok(%Zodbot.data,3,32) $calc($ini(lrank.ini,돈,%lppl) + 1) $+ 위 :  $nickdt($ini(lrank.ini,돈,%downrank)) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,$ini(lrank.ini,돈,%downrank)) $+ ) , 총인원 : $comgen( $+ $ini(lrank.ini,돈,0) $+ ) $+ 명
  }
  elseif (%uprank == $ini(lrank.ini,돈,0)) {
    privmsg $gettok(%Zodbot.data,3,32) $calc($ini(lrank.ini,돈,%lppl) - 1) $+ 위 :  $nickdt($ini(lrank.ini,돈,%uprank)) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,$ini(lrank.ini,돈,%uprank)) $+ )
    privmsg $gettok(%Zodbot.data,3,32) $ini(lrank.ini,돈,%lppl) $+ 위 :  $nickdt(%lppl) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,%lppl) $+ ) , 총인원 : $comgen( $+ $ini(lrank.ini,돈,0) $+ ) $+ 명
  }
  else {
    privmsg $gettok(%Zodbot.data,3,32) $calc($ini(lrank.ini,돈,%lppl) - 1) $+ 위 :  $nickdt($ini(lrank.ini,돈,%uprank)) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,$ini(lrank.ini,돈,%uprank)) $+ )
    privmsg $gettok(%Zodbot.data,3,32) $ini(lrank.ini,돈,%lppl) $+ 위 :  $nickdt(%lppl) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,%lppl) $+ )
    privmsg $gettok(%Zodbot.data,3,32) $calc($ini(lrank.ini,돈,%lppl) + 1) $+ 위 :  $nickdt($ini(lrank.ini,돈,%downrank)) $+ 님, 소지금 : $comgen( $+ $readini(lrank.ini,돈,$ini(lrank.ini,돈,%downrank)) $+ ) , 총인원 : $comgen( $+ $ini(lrank.ini,돈,0) $+ ) $+ 명
  }
}
alias 계정초기화 {
  %j = 1
  var %exitq $calc($ini(caction.ini,계정,0) + 1)
  while (%j < %exitq) {
    writeini -n caction.ini 계정 $ini(caction.ini,계정,%j) 0
    inc %j
  }
}
alias unset_var {
  set %hchatc off
  timercchatc off
  unset %rep
  set %tlimiter off
  set %tcalc 0
  set %activatebot on
  unset %timelset
  unset %cerror
}
alias invader {

  remini cmdlimit.ini 전체 #Zod
  set %activatebot on

  var %blue.limit $readini(cityi.ini,%blue.target,용병제한)

  var %blue.attackp $readini(cityi.ini,%blue.target,용병수)
  var %blue.attackp1 $readini(cityi.ini,%blue.target,보병)
  var %blue.attackp2 $readini(cityi.ini,%blue.target,기마병)
  var %blue.attackp3 $readini(cityi.ini,%blue.target,중갑보병)
  if (!%blue.attackp1) { var %blue.attackp1 $chr(48) }
  if (!%blue.attackp2) { var %blue.attackp2 $chr(48) }
  if (!%blue.attackp3) { var %blue.attackp3 $chr(48) }

  var %blue.attackz $rand(300,%blue.limit)
  var %blue.attackz1 $int($calc(%blue.attackz * 0.2))
  var %blue.attackz2 $int($calc(%blue.attackz * 0.3))
  var %blue.attackz3 $int($calc(%blue.attackz * 0.5))
  var %blue.tmp $calc(%blue.attackz1 + %blue.attackz2 + %blue.attackz3)
  if (%blue.tmp != %blue.attackz) { var %blue.attackz3 $calc(%blue.attackz1 + 3) }

  var %blue.sp $int($calc((%blue.attackp1 * 1 + %blue.attackp2 * 2 + %blue.attackp3 * 3) * 2))
  var %blue.sz $int($calc((%blue.attackz1 * 2 + %blue.attackz2 * 3 + %blue.attackz3 * 8) * 2))
  if (%blue.sp = %blue.sz) { var %blue.sz $calc(var %blue.sz - 1) }
  if (%blue.sp > %blue.sz) { var %blue.judge 12(방어군 승리!) | var %blue.j 1 }
  if (%blue.sp < %blue.sz) { var %blue.judge 4(침략군 승리!) | var %blue.j 2 }

  privmsg #Zod 목표 : %blue.target ( $+ $nickdt($ini(cityinv.ini,%blue.victim)) $+ 님 소유 $+ ) / 방어군 : $comgen(%blue.attackp) $+ 명 (보병 : $comgen(%blue.attackp1) $+ , 기마병 : $comgen(%blue.attackp2) $+ , 중갑보병 : $comgen(%blue.attackp3) $+ ) / 침략군 : $comgen(%blue.attackz) $+ 명 (보병 : $comgen(%blue.attackz1) $+ , 기마병 : $comgen(%blue.attackz2) $+ , 중갑보병 : $comgen(%blue.attackz3) $+ )
  privmsg #Zod 침략군의 공격!4 $comgen(%blue.sz) $+ 의 데미지!!1 / 방어군의 공격!4 $comgen(%blue.sp) $+ 의 데미지!! %blue.judge
  if (%blue.j == 1) {
    var %blue.death $int($calc((%blue.sz / %blue.sp) * %blue.attackp))
    var %blue.d1 $int($calc(%blue.death * 0.5))
    var %blue.d2 $int($calc(%blue.death * 0.3))
    var %blue.d3 $int($calc(%blue.death * 0.2))
    if (!%blue.attackp1 || %blue.attackp1 == 0) { var %blue.d3 $calc(%blue.d3 + %blue.d1) | var %blue.d1 $chr(48) }
    if (%blue.attackp1 < %blue.d1 ) { var %blue.d2 $calc(%blue.attackp1 + %blue.d2) | var %blue.d1 %blue.attackp1 }        

    if (!%blue.attackp2 || %blue.attackp2 == 0) { var %blue.d3 $calc(%blue.d3 + %blue.d2) | var %blue.d2 $chr(48) }
    if (%blue.attackp2 < %blue.d2 ) { var %blue.d3 $calc(%blue.attackp2 + %blue.d3) | var %blue.d2 %blue.attackp2 }

    if (!%blue.attackp3 || %blue.attackp3 == 0) {
      if (%blue.attackp1) {
        var %blue.d1 $calc(%blue.d1 + %blue.d3) | var %blue.d3 $chr(48)
        if (%blue.attackp3 < %blue.d3 ) { var %blue.d1 $calc(%blue.attackp3 + %blue.d1) | var %blue.d3 %blue.attackp3 }
      }
      else {
        var %blue.d1 $calc(%blue.d1 + %blue.d3) | var %blue.d3 $chr(48)
        if (%blue.attackp3 < %blue.d3 ) { var %blue.d2 $calc(%blue.attackp3 + %blue.d2) | var %blue.d3 %blue.attackp3 }
      }
    }
    var %blue.death $calc(%blue.d1 + %blue.d2 + %blue.d3)
    writeini -n cityi.ini %blue.target 용병수 $calc(%blue.attackp - %blue.death)
    writeini -n cityi.ini %blue.target 보병 $calc(%blue.attackp1 - %blue.d1)
    writeini -n cityi.ini %blue.target 기마병 $calc(%blue.attackp2 - %blue.d2)
    writeini -n cityi.ini %blue.target 중갑보병 $calc(%blue.attackp3 - %blue.d3)

    var %blue.attackp $readini(cityi.ini,%blue.target,용병수)
    var %blue.attackp1 $readini(cityi.ini,%blue.target,보병)
    var %blue.attackp2 $readini(cityi.ini,%blue.target,기마병)
    var %blue.attackp3 $readini(cityi.ini,%blue.target,중갑보병)

    privmsg #Zod 방어군 사망 : %blue.death $+ 명 (보병 : $comgen(%blue.d1) $+ , 기마병 : $comgen(%blue.d2) $+ , 중갑보병 : $comgen(%blue.d3) $+ ) / 잔여병력 : $comgen(%blue.attackp) $+ 명 (보병 : $comgen(%blue.attackp1) $+ , 기마병 : $comgen(%blue.attackp2) $+ , 중갑보병 : $comgen(%blue.attackp3) $+ )
  }
  if (%blue.j == 2) {
    var %blue.fsell %blue.target
    var %bank.cost $int($calc(($readini(cityi.ini,%blue.fsell,가격) + $readini(cityi.ini,%blue.fsell,호) * $readini(cityi.ini,%blue.fsell,호텔) + $readini(cityi.ini,%blue.fsell,빌) * $readini(cityi.ini,%blue.fsell,빌딩) + $readini(cityi.ini,%blue.fsell,별) * $readini(cityi.ini,%blue.fsell,별장)) * 0.8))
    var %bank.ha $readini(cityi.ini,%blue.fsell,호)
    var %bank.ba $readini(cityi.ini,%blue.fsell,빌)
    var %bank.pa $readini(cityi.ini,%blue.fsell,별)
    remini -n cityi.ini %blue.fsell 지주
    remini -n cityi.ini %blue.fsell 용병수
    remini -n cityi.ini %blue.fsell 보병
    remini -n cityi.ini %blue.fsell 기마병
    remini -n cityi.ini %blue.fsell 중갑보병
    remini -n cityinv.ini $ini(cityinv.ini,%blue.victim) %blue.fsell
    writeini -n cityi.ini %blue.fsell 호 $chr(48)
    writeini -n cityi.ini %blue.fsell 빌 $chr(48)
    writeini -n cityi.ini %blue.fsell 별 $chr(48)
    writeini -n tmp_exp.ini 돈 $ini(cityinv.ini,%blue.victim) $int($calc($readini(tmp_exp.ini,돈,$ini(cityinv.ini,%blue.victim)) + %bank.cost))
    privmsg #Zod 방어군이 패배하여 %blue.fsell $+ 의 부지( $+ $comgen($readini(cityi.ini,%blue.fsell,가격)) $+ 원)와 호텔 %bank.ha $+ , 빌딩 %bank.ba $+ , 별장 %bank.pa $+ 채를 80% 가격인 $comgen(%bank.cost) $+ 원에 강제 매각하였습니다. (잔액 : $comgen($readini(tmp_exp.ini,돈,$ini(cityinv.ini,%blue.victim))) $+ 원)
    unset %blue.target
  }
  timer침공 0 7200 invader
  timer침공2 0 6600 bluecast
  halt  
}
alias 임시침공 {
  timer임시침공 1 300 invader
  bluecast
  timer침공 0 7200 invader
  timer침공2 0 6600 bluecast
}
alias bluecast {
  :citysel
  set %blue.victim $rand(2,$ini(cityinv.ini,0))
  set %blue.target $ini(cityinv.ini,%blue.victim,$rand(1,$ini(cityinv.ini,%blue.victim,0)))
  if (!%blue.target || %blue.target == 0) {
    remini cityinv.ini %blue.victim
    goto citysel
  }  
  privmsg #Zod [부르마블 방송] 10분 후 괴뢰군단 Zod군이 %blue.target $+ ( $+ $nickdt($ini(cityinv.ini,%blue.victim)) $+ 님 소유 $+ )에 침략할 예정입니다.
  halt
}

; privmsg 함수
; 출력과 관계된 옵션
; cmdlimit.ini의 [전체]텝과 관련되며
; #채널=번호 로 처리된다.
; 번호 설명
; 1~3 : empty slot (채널명=1~3 으로 지정시 해당 채널 Zod 사용불가)
; 4 : notice 출력
; 5 : 흑백 출력
alias -l privmsg {
  var %zodmsg1 = $readini(cmdlimit.ini,$remove(%cmdconvert,$chr(45),$chr(64),$chr(33)),%checkerc)
  var %zodmsg2 = $readini(cmdlimit.ini,전체,%checkerc)
  if (%zodmsg1 == 5) { sockwrite -nt Zodbot PRIVMSG $1 $+(:,$strip($2-)) }
  if (%zodmsg2 == 5) { sockwrite -nt Zodbot PRIVMSG $1 $+(:,$strip($2-)) }
  if (%zodmsg2 == 4) { if (%checkern != $me) { echo -a $1 $+ 채널에서의 Zod 출력내용 : $2- } | sockwrite -nt Zodbot notice %checkern $1 $+(:,$2-) }
  if (%zodmsg1 == 4) { if (%checkern != $me) { echo -a $1 $+ 채널에서의 Zod 출력내용 : $2- } | sockwrite -nt Zodbot notice %checkern $1 $+(:,$2-) }
  ; 일반 출력 처리 ($readini(cmdlimit.ini,전체,채널명) 이 1~3인경우 출력이 제한 된다.)
  if ($readini(admin.ini,ip,%checkera) == 1) {
    if (%zodmsg1 isnum 1-3 || %zodmsg2 isnum 1-3) { sockwrite -nt Zodbot PRIVMSG $1 $+(:,$2-) }
  }
  if (!%zodmsg1 && !%zodmsg2) { sockwrite -nt Zodbot PRIVMSG $1 $+(:,$2-) }
}
alias -l servlists { var %i = 0, %tmp | while (%i < $lines(servlist.txt)) { inc %i | %tmp = %tmp $read(servlist.txt,%i) } | return %tmp }
alias -l banlists { var %i = 0, %tmp | while (%i < $lines(banlist.txt)) { inc %i | %tmp = %tmp $read(banlist.txt,%i) } | return %tmp }
alias hasLastConsonate {
  if ($asc($right($1,1)) < 128) return $false
  var %str = $right($1,2)
  if (%str isin %lastcon) { return $false }
  else { return $true }
}
alias masking {
  var %i 0
  var %len $len($1)
  var %mask $remove($1,$chr(35))
  var %masked $chr(35) $+ $mid(%mask,1,2) $+ $str($chr(42),$calc($rand(1,10)))
  return %masked
}
alias josa {
  return $1 $+ $iif($hasLastConsonate($1),$left($2,2),$right($2,2))
}
; $josa(리버스,이가)

alias activatebot {
  set %activatebot on
  sockwrite -nt Zodbot notice $me : $+ 저의 60초 이그노어를 해제하겠습니다.
}
alias botexit {
  window -c @Zodbot
  sockwrite -tn Zodbot quit :주인님의 명령으로 종료합니다. 좋은 하루되세요.
  sockclose Zodbot
  run dbbackup.bat
  halt
}
alias bin2hex {
  unset %bin2hex*
  set %bin2hex.len $len($1-)
  :startbin2hex
  inc %bin2hex.now
  set %bin2hex.return %bin2hex.return $+ $chr(37) $+ $base($asc($mid($1-,%bin2hex.now,1)),10,16)
  if ( %bin2hex.now == %bin2hex.len ) return %bin2hex.return
  goto startbin2hex
}
alias uiif {
  if ($1) && ($2) && (!$3) return $iif($rand(1,2) == 1,$1,$2)
  if ($1) && ($2) && ($3) return $iif($rand(1,2) == 1,$1,$iif($rand(1,2) == 2,$2,$3))
}
alias uin {
  set %color.st $replace(%color.st,주인공,즨○,오빠,읍ㅎ℉,가,$uiif(家,ワ┞,>r),나,$uiif(㈏,じ├,Иа,Ŀr,㎁),다,$uiif(多,て℉,Σι),라,$uiif(ㄹr,яΑ,㈑),마,$uiif(㈒,馬,㎃,¤r),바,$uiif(ぱｒ,ぼ,はド),사,四,아,$uiif(øド,㈕,あ,亞),자,$uiif(ざ,子,ズㅏ),차,車,카,$uiif(か,㉸),타,タ,파,ㅍr,하,$uiif(㈛,下,河,㏊,ㆅｒ,あド),상,上,지,$uiif(ズノ,㈈l,地,ズı,之),별,$uiif(★,☆),일,1,이,$uiif(。l,②,ØI,2),삼,3,사,4,오,$uiif(5,⑤),육,6,칠,7,팔,8,구,$uiif(九,口),십,十)
  set %color.st $replace(%color.st,티,T,비,B,씨,C,디,$uiif(㉢I,D,Ð,てエ),에프,F,지,G,쥐,G,치,治,엘,L,엠,M,엔,N,피,P,큐,Q,알,$uiif(R,я),에스,S,유,U,에,え,더,The,우,$uiif(牛,♀),정,正,요,Yo,입,入,스,す,로,$uiif(Ro,яо),장,長,데,$uiif(で,ゼぅ,㈂ㅓl,Ðё),ㅋ,ヲ,ㅇ,$uiif(Ο,Θ,Ø),o,$uiif(Ο,Θ,Ø),a,$uiif(ⓐ,Α),b,Β,뻐큐,$uiif(凸,山,品),어,$uiif(漁,ㅇ-I,øつ),소,小,품,品,개,ㄱЙ,꺼,ㄲう,니,$uiif(느l,しı,し!))
  set %color.st $replace(%color.st,정,政,주,㈜,내,$uiif(じĦ,じＨ),깨,ㄲĦ,인,人,계,ㄱ=ll,ㅂ,$uiif(㉥,凹),안,$uiif(Øど,øよ),요,훀,이,ⓔ,쓰,ム,외,外,뷰,ㅸ,붕,ㅸ,고,$uiif(GO,高,ⓖΘ),수,水,공,겅,말,末,기,긔,로,뤄,그,$uiif(긐,ュ),해,㉭┣┃,부,富,리,$uiif(르1,㉣ı,乙l),시,λı,까,㉠㉠┣,을,$uiif(乙,읊),친,틘,I,ⓘ,만,뫙,운,흔,네,$uiif(눼,じ┧┃),제,뎨,후,Who,녕,じギ∽㉧,야,øギ,니,Ŋı)
  set %color.st $replace(%color.st,뭔,母~옹,몬,母~옹,귀,구！,연,Ωぎじ,님,$uiif(늼,늠l),왜,ⓦⓗⓨ,욕,$uiif(룍,욖),!,i,~,∽,꾸,끘,*,$uiif(☆,★),면,ロぎ,때,땠,찌,쯰,줄,쥮,엿,$uiif(凸,山,品,oo0oo),쁜,ㅹ,새,쒰,끼,$uiif(ヲ∥,┓┓┃),낄,$uiif(㉠㉠┃∽㉣,┓┓┃∽㉣),너,じナ,읽,ⓔㄹ,봤,ばち,개,コㅐ,레,яё,미,мi,^,⌒,좋,죠,은,응,작,쟊,품,品,젠,줸,키,ヲ¡,?,¿ ,금,金,테,㉫ㅔ,져,Jㅕ,저,Jㅓ,도,ＤＯ,남,男,쌔,んんㅐ,애,ㅇけ,대,ㄷけ,되,$uiif(で,ゼぅ,㈂ㅓl,Ðё),ㅎ,㉭,크,ヨ,스,ム,봐,보г,바,ㅂr)
  set %color.st $replace(%color.st,1,$uiif(①,⑴),2,$uiif(②,⑵),3,$uiif(③,⑶),4,$uiif(④,⑷),5,$uiif(⑤,⑸),6,$uiif(⑥,⑺),7,$uiif(⑦,⑺),8,$uiif(⑧,⑻),9,$uiif(⑨,⑼))
}
alias antiflood {
  set %slangcall 0
  set %surecall 0
  set %kungcall 0
  set %antifloodu off
  set %floodcounter off
}
alias timenow {
  var %timenow $asctime(tt hh:nn:ss)
  var %timenow1 $replace(%timenow,0,┏┓,1,　┫,2,┏┓,3,┏┓,4,┃┃,5,┏┓,6,┏┓,7,┏┓,8,┏┓,9,┏┓,p,┏┓,m,┏┳┓,a,┏┓,$chr(58),○,B,┃　,C,┏┓,D,　┃,E,┏━,F,┏━)
  var %timenow2 $replace(%timenow,0,┃┃,1,　┃,2,┏┛,3,　┫,4,┗╋,5,┗┓,6,┣┓,7,　┃,8,┣┫,9,┗┫,p,┣┛,m,┃┃┃,a,┣┫,$chr(58),　,B,┣┓,C,┃　,D,┏┫,E,┣━,F,┣━)
  var %timenow3 $replace(%timenow,0,┗┛,1,　┻,2,┗┛,3,┗┛,4,　┃,5,┗┛,6,┗┛,7,　┃,8,┗┛,9,┗┛,p,　　,m,　　　,a,┃┃,$chr(58),○,B,┗┛,C,┗┛,D,┗┛,E,┗━,F,┃　)
  privmsg $gettok(%Zodbot.data,3,32) %timenow1
  privmsg $gettok(%Zodbot.data,3,32) %timenow2
  privmsg $gettok(%Zodbot.data,3,32) %timenow3 
}
alias rtimenow {
  if (%radix == bin) { var %radi Binary | goto timecalc }
  if (%radix == qua) { var %radi Quaternary | goto timecalc }
  if (%radix == oct) { var %radi Octal | goto timecalc }
  if (%radix == hex) { var %radi Hexadecimal | goto timecalc }
  else { privmsg $gettok(%Zodbot.data,3,32) 제대로 된 진수가 아닙니다. 다시 확인하여 주시기 바랍니다. | unset %radix | halt }
  :timecalc
  var %timenow $asctime(tt hh:nn:ss)
  var %timenow = $asctime(tt) $+ $dec2bqox($asctime(hh),%radix) $+ $chr(58) $+ $dec2bqox($asctime(nn),%radix) $+ $chr(58) $+ $dec2bqox($asctime(ss),%radix)
  var %timenow1 $replace(%timenow,0,┏┓,1,　┫,2,┏┓,3,┏┓,4,┃┃,5,┏┓,6,┏┓,7,┏┓,8,┏┓,9,┏┓,p,┏┓,m,┏┳┓,a,┏┓,$chr(58),○,B,┃　,C,┏┓,D,　┃,E,┏━,F,┏━)
  var %timenow2 $replace(%timenow,0,┃┃,1,　┃,2,┏┛,3,　┫,4,┗╋,5,┗┓,6,┣┓,7,　┃,8,┣┫,9,┗┫,p,┣┛,m,┃┃┃,a,┣┫,$chr(58),　,B,┣┓,C,┃　,D,┏┫,E,┣━,F,┣━)
  var %timenow3 $replace(%timenow,0,┗┛,1,　┻,2,┗┛,3,┗┛,4,　┃,5,┗┛,6,┗┛,7,　┃,8,┗┛,9,┗┛,p,　　,m,　　　,a,┃┃,$chr(58),○,B,┗┛,C,┗┛,D,┗┛,E,┗━,F,┃　)
  privmsg $gettok(%Zodbot.data,3,32) %timenow1
  privmsg $gettok(%Zodbot.data,3,32) %timenow2
  privmsg $gettok(%Zodbot.data,3,32) %timenow3 ( $+ %radi $+ )
  unset %radix
}
alias blahnick {
  var %i = 0
  var %j = 0
  var %blahran = 3
  var %blahran2 = $rand(5,10)
  var %blahnick
  var %blahnick2
  var %youhon $rand(1,100)
  while (%i < %blahran) {
    inc %i
    %blahnick = %blahnick $+ $chr($rand(176,200)) $+ $chr($rand(161,200))
  }
  while (%j < %blahran2) {
    inc %j
    %blahnick2 = %blahnick2 $+ $chr($rand(176,200)) $+ $chr($rand(161,200))
  }
  if (%youhon = 44) {
    return (가끔은 재수없는 경우로 유언이 존재하지 않습니다. ^^;)
  }
  else {
    return %blahnick $+ $uiif($chr(33),$chr(126),$chr(63)) %blahnick2
  }
}
alias hannick {
  var %i = 0
  var %hanran = $rand(3,3)
  var %hannick
  while (%i < %hanran) {
    inc %i
    %hannick = %hannick $+ $chr($rand(176,200)) $+ $chr($rand(161,254))
  }
  return %hannick
}
alias hannick2 {
  var %i = 0
  var %hanran = $rand($2,$2)
  var %hannick
  while (%i < %hanran) {
    inc %i
    %hannick = %hannick $+ $chr($rand(176,200)) $+ $chr($rand(161,254))
  }
  return %hannick
}
alias engnick {
  var %i 0
  :engen
  var %pronm $rand(1,31)
  var %pron1 = $replace(%pronm,0,$rand(a,z),1,$rand(a,z),2,ce,3,ck,4,gh,5,kn,6,ph,7,qu,8,sc,9,sh,10,su,11,th,12,wh,13,ah,14,sch,15,rh,16,sk,17,sp,18,$rand(a,z),19,$rand(a,z),20,$rand(a,z),21,$rand(a,z),22,$rand(a,z),23,$rand(a,z),24,$rand(a,z),25,$rand(a,z),26,$rand(a,z),27,$rand(a,z),28,un,29,de,30,un,31,re)
  var %pronn $rand(1,40)
  var %pron2 = $replace(%pronn,0,ar,1,a,2,i,3,e,4,o,5,u,6,y,7,ee,8,ai,9,ou,10,ei,11,ea,12,oo,13,ey,14,io,15,ae,16,uo,17,eu,18,ue,19,ay,20,ai,22,au,23,aw,24,ce,25,,32,ts,33,z,34,x,35,ah,36,am,37,ap)
  var %pronl $rand(1,42)
  var %pron3 = $replace(%pronl,0,ar,1,a,2,i,3,e,4,o,5,u,6,y,7,ay,8,ai,9,alm,10,au,11,aw,12,ce,13,eigh,14,ie,15,oul,16,tion,17,sion,18,tch,19,dge,20,ts,21,z,22,x,23,ah,24,am,25,ap,26,ough,27,stion,28,ation,29,er,30,or)
  var %suc = $rand(1,3)
  if (%suc == 1) {
    var %compnick = %compnick $+ %pron1 $+ %pron2 $+ %pron3
  }
  if ((%suc == 2) || (%suc == 3)) {
    inc %i
    var %compnick = %compnick $+ %pron1 $+ %pron2 $+ %pron3
    if (%i < 1) {
      goto engen
    }
  }
  return %compnick
}
alias daynow {
  var %daynow $asctime(yyyy:mm:dd) $+ $chr(91) $+ $mid($day,1,3) $chr(93)
  var %daynow1 $replace(%daynow,0,┏┓,1,　┫,2,┏┓,3,┏┓,4,┃┃,5,┏┓,6,┏┓,7,┏┓,8,┏┓,9,┏┓,p,┏┓,m,┏┳┓,a,┏┓,$chr(58),　,o,┏┓,n,┏┓,t,　┳,u,　　,e,┏━,w,┃┃┃,d,　┃,i,　●,h,┃　,s,┏┓,f,┏━,r,　　,$chr(91),　┏,$chr(93),┓　)
  var %daynow2 $replace(%daynow,0,┃┃,1,　┃,2,┏┛,3,　┫,4,┗╋,5,┗┓,6,┣┓,7,　┃,8,┣┫,9,┗┫,p,┣┛,m,┃┃┃,a,┣┫,$chr(58),　,o,┃┃,n,┃┃,t,　┃,u,┃┃,e,┣━,w,┃┃┃,d,┏┫,i,　┃,h,┣┓,s,┗┓,f,┣━,r,┏━,$chr(91),　┃,$chr(93),┃　)
  var %daynow3 $replace(%daynow,0,┗┛,1,　┻,2,┗┛,3,┗┛,4,　┃,5,┗┛,6,┗┛,7,　┃,8,┗┛,9,┗┛,p,　　,m,　　　,a,　　,$chr(58),○,o,┗┛,n,　　,t,　┃,u,┗┛,e,┗━,w,┗┻┛,d,┗┛,i,　┃,h,┃┃,s,┗┛,f,┃　,r,┃　,$chr(91),　┗,$chr(93),┛　)
  ;  set %daycalc $calc($asctime(dd) - $int($asctime(yy) / 0.2) + $asctime(hh))
  privmsg $gettok(%Zodbot.data,3,32) 오늘날짜는 %daynow1
  privmsg $gettok(%Zodbot.data,3,32) 　　　　　 %daynow2
  privmsg $gettok(%Zodbot.data,3,32) 　　　　　 %daynow3 입니다.
}
alias boldfont {
  set %lan.use.rep $replace(%lan.use.msg,ㅡ,━,$chr(43),╋,ㄱ,┓,ㄴ,┗,=,$uiif(〓,ご),ㅠ,┭┮,^,⌒,ㅁ,皿)
  set %lan.use.rep $replace(%lan.use.rep,1,$uiif(①,⑴),2,$uiif(②,⑵),3,$uiif(③,⑶),4,$uiif(④,⑷),5,$uiif(⑤,⑸),6,$uiif(⑥,⑺),7,$uiif(⑦,⑺),8,$uiif(⑧,⑻),9,$uiif(⑨,⑼))
}
alias antiidle {
  .timerantiidle $+ $server 0 15 .msg 1 1
  .away Anti-idle 작동중.. 표시되는 잠수시간은 언제나 1분 이내입니다.
}
raw 401:*: { if ($1-2 == $me 1 ) { halt } }


; raw *:*: {
;  if ( %useraw != 1 ) return
;  if ( !$window(@raw) ) { window @raw }
;  echo @raw raw번호 : $numeric 메세지 : $1-
; }
alias autoconnect {
  server $read(bot.txt,s,server)
  ; server -m zice.dankun.net
}
alias deltag { .echo -q $regsub(<html>가나다라</html>,/(<[^>]+>)/g,,%tmp) | return %tmp }
alias passwd return $decode($read(pass.txt,2),m)
alias id return $decode($read(pass.txt,1),m)
alias myautojoin {
  if ( $network == HanIRC ) {
    .join %hautojoin
  }
  if ( $network == Ozinger ) {
    .join %oautojoin
  }
}
Alias myautojoinadd {
  if ( $network == HanIRC ) {
    set %hautojoin %hautojoin $+ $chan $+ $chr(44)
    echo -a 현재 채널이 자동접속 목록에 등록 돼었습니다. [채널: $chan $+ ]
  }
  if ( $network == Ozinger ) {
    set %oautojoin %oautojoin $+ $chan $+ $chr(44)
    echo -a 현재 채널이 자동접속 목록에 등록 돼었습니다. [채널: $chan $+ ]
  }
}
Alias myautojoindel {
  if ( $network == HanIRC ) {
    var %hautojoin2 $chan $+ $chr(44)
    set %hautojoin $remove(%hautojoin,%hautojoin2)
    echo -a 현재 채널에 대한 명령이 처리되었습니다. [채널 : $chan $+ ]
  }
  if ( $network == Ozinger ) {
    var %oautojoin2 $chan $+ $chr(44)
    set %oautojoin $remove(%dautojoin,%dautojoin2)
    echo -a 현재 채널에 대한 명령이 처리되었습니다. [채널 : $chan $+ ]
  }
}
alias randomgen {
  ; 변수 초기화
  set %randomgencnt 0
  set %maxloop 200
  unset %randomreturn
  ; 잰 시작..
  :startrandomgen
  ;잰 cnt를 체크함.. 잰 cnt가 전부 올라가면 값 리턴..
  if ( %randomgencnt == $1 ) return %randomreturn
  ; 무한루프로 빠지는것을 방지함.. 위에 maxloop에 설정한 대까지만.. 루프를 돌림.
  if ( %maxloop == %randomgencnt ) return %randomreturn
  ; 다시잰할때 대비..
  :regen
  ;1~255부터 잰함.
  set %tttttemp $chr($rand(1,255))
  ; 13 이나 10은 리턴함 ( line is too long 방지 )
  if ( %tttttemp == $chr(13)) || ( %tttttemp == $chr(10)) goto regen
  ;잰한문자를 버퍼에 더함
  set %randomreturn %randomreturn $+ %tttttemp
  ; 잰 카운트 올림.
  inc %randomgencnt
  ;잰 시작점으로 돌아감.
  goto startrandomgen
  ; 사용법 $randomgen($rand(1,50000))
}
alias engen {
  var %namelen $rand(3,10)
  var %i 0  
  while ((%cname == $chr(65)) || (%cname == $chr(69)) || (%cname == $chr(73)) || (%cname == $chr(79)) || (%cname == $chr(85))) {
    var %cname $chr($rand(65,90))
  }
  while ((%cname == $chr(97)) || (%cname == $chr(101)) || (%cname == $chr(105)) || (%cname == $chr(111)) || (%cname == $chr(117))) {
    var %jname $chr($rand(97,122))
  }
  while (%i <= %namelen) {
    inc %i
    var %zname $chr($rand(97,122))
    var %name %name $+ %zname
  }
  return %cname $+ %name
}
alias textgen {
  var %j = 1
  :again
  var %maxn 0
  var %i = 0
  while (%i <= %maxn) {
    inc %i
    var %nameg1 = $read(무협.txt)
    var %nameg2 = %nameg2 $gettok(%nameg1,1,32)
    var %nameg3 = %nameg3 $gettok(%nameg1,2,32)
  }
  var %nameresult = $remove(%nameg2 $+ $chr(40) $+ %nameg3 $+ $chr(41),$chr(32))
  write 아이디.txt %nameresult
  var %nameg1 = $read(무협.txt)
  var %nameg2 = $gettok(%nameg1,1,32)
  var %nameg3 = $gettok(%nameg1,2,32)
  if (%j <= 10000) {
    inc %j
    goto again
  }
  halt
}
alias cmdcheck {
  var %checker $remove(%cmdconvert,$chr(45),$chr(64),$chr(33))
  if ($readini(cmdlimit.ini,전체,점검) == 1) {
    if (%checkern != $me) { halt }
  }
  if ($readini(cmdlimit.ini,전체,%checkerc) == 1) {
    if ($readini(admin.ini,ip,%checkera) != 1) { halt }
  }
  if ($readini(cmdlimit.ini,%checker,%checkerc) == 1) {
    if (%checkern != $me) { halt }
  }
}
alias shuffle {
  if ($isid) {
    var %i = 0
    set %shuffle
    while (%i < $numtok($1,32)) { 
      inc %i
      set %shuffle $instok(%shuffle,$gettok($1,%i,32),$rand(1,$numtok(%shuffle,32)),32)
    }
    return %shuffle
  }
}
alias antiflooder {
  set %tlimiter on
  timerivflood 1 5 set %ivflood off
  set %katcom $remove(%cmdconvert,$chr(64),$chr(45),$chr(33))
  timerunset 1 $calc($readini(cmdlimit.ini,%katcom,시간제한) * $readini(cmdlimit.ini,배수,%checkerc)) unset_var
  writeini amount.ini 사용량 %checkerc $calc($readini(amount.ini,사용량,%checkerc) + 1)
  if ($readini(cmdlimit.ini,사용량제한,%checkerc) <= $readini(amount.ini,사용량,%checkerc)) {
    privmsg %checkerc %checkerc $+ 채널은 사용량이 너무 많아 일정시간동안 명령어 시간제한이 2배로 늘어납니다.
    writeini amount.ini 사용량 %checkerc 1
    writeini cmdlimit.ini 배수 %checkerc $calc($readini(cmdlimit.ini,배수,%checkerc) + 1)
    timer $+ %checkerc $+ 배수 1 1200 writeini cmdlimit.ini 배수 %checkerc 1
  }
  set %timelset $readini(cmdlimit.ini,%katcom,시간제한)
  ; 타이머방지 알고리즘
  set %fixedtime $asctime(HH nn ss)
  set %catime $calc($gettok(%fixedtime,1,32) * 3600 + $gettok(%fixedtime,2,32) * 60 + $gettok(%fixedtime,3,32))
  timertr $+ %checkern 1 60 trackingoff %checkern
  if ($readini(tracking.ini,nick,%checkern)) {
    if ($readini(tracking.ini,interval,%checkern)) {
      ; 3. 현재시간간격과 2항에서 계산된 시간간격이 동일하면 카운트 추가.
      if ($readini(tracking.ini,noncount,%checkern) >= 5) {
        writeini tracking.ini count %checkern 1
        writeini tracking.ini noncount %checkern 1
      }
      if ($calc(%catime - $readini(tracking.ini,time,%checkern)) == $readini(tracking.ini,interval,%checkern)) {
        writeini tracking.ini count %checkern $calc($readini(tracking.ini,count,%checkern) + 1)
      }
      if ($calc(%catime - $readini(tracking.ini,time,%checkern)) != $readini(tracking.ini,interval,%checkern)) {
        writeini tracking.ini noncount %checkern $calc($readini(tracking.ini,noncount,%checkern) + 1)
      }
      ; 5. 카운트가 10이 되면 제재 시작.
      if ($readini(tracking.ini,count,%checkern) >= 11) {
        writeini warning.ini 아이디 $readini(tracking.ini,nick,%checkern) %checkern $+ 님은 최근 10회간 사용을 분석결과 $readini(tracking.ini,interval,%checkern) $+ 초 간격으로 타이머를 사용하신것으로 판단되어 블랙리스트에 등록하였습니다.
      }
      ; 4. 시간간격을 갱신한다.
      writeini tracking.ini interval %checkern $calc(%catime - $readini(tracking.ini,time,%checkern))
    }
    ; 2. 현재 시간간격을 계산한다.
    if (!$readini(tracking.ini,interval,%checkern)) {
      writeini tracking.ini interval %checkern $calc(%catime - $readini(tracking.ini,time,%checkern))
    }
    writeini tracking.ini time %checkern %catime
  }
  ; 1. 정보를 기록한다.
  if (!$readini(tracking.ini,nick,%checkern)) {
    writeini -n tracking.ini nick %checkern %checkera
    writeini -n tracking.ini time %checkern %catime
    writeini -n tracking.ini count %checkern $chr(48)
  }
  write " $+ $logdirZod\log_ $+ $asctime(yymmdd) $+ .txt $+ " $chr(91) $+ $asctime(TT hh:nn:ss) $+ $chr(93) - %checkern $+ 님에 의해 %checkerc $+ 채널에서 " $+ %katcom2 $+ " 명령이 실행. (사용 IP : %checkera $+ , 반복 Count : $readini(tracking.ini,count,%checkern) $+ , 시간간격 : $readini(tracking.ini,interval,%checkern) $+ 초) 
}
alias trackingoff {
  remini tracking.ini Nick $$1
  remini tracking.ini time $$1
  remini tracking.ini count $$1
  remini tracking.ini noncount $$1  
  remini tracking.ini interval $$1
}
alias prefixchk {
  if ($readini(prefix.ini,$1,p1) == %rmcmd) { return OK }
  elseif ($readini(prefix.ini,$1,p2) == %rmcmd) { return OK }
  elseif ($readini(prefix.ini,$1,p3) == %rmcmd) { return OK }
  else { return NO }
}
alias 컬러 { 
  if ($1 == $Null) { %color.시스템 = $iif(%color.시스템 == 실행,해제,실행) }
  else { if ($1 isnum) && ($1 >= 1) && ($1 <= 15) { if ($1 <= 9) { %color.색 = 0 $+ $1 }  | else { %color.색 = $1 } | %color.시스템 = 실행 | %color.ren = 해제 }
    else { echo -a 1~15까지만 가능 }
  }
  sockwrite -tn Zodbot PRIVMSG $chan : $+  $+ %color.색 색글을 %color.시스템 합니다.
}
alias 볼드 { 
  if ($1 == $Null) { %color.bold = $iif(%color.bold == 실행,해제,실행) }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 볼드를 %color.bold 합니다.
}
alias 밑줄 {
  if ($1 == $Null) { %color.j = $iif(%color.j == 실행,해제,실행) }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 밑줄을 %color.j 합니다.
}
alias 랜덤 { 
  if ($1 == $Null) { %color.ren = $iif(%color.ren == 실행,해제,실행) } 
  elseif (%color.시스템 == 실행) {  %color.시스템 = 해제 }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 랜덤글색을 %color.ren 합니다.
}

alias 다끔 {
  %color.시스템 = 해제
  %color.bold = 해제
  %color.j = 해제
  %color.ren = 해제
  %color.말머리 = 해제
  %color.말꼬리 = 해제
  %color.리버스 = 해제
  %color.외계어 = 해제
  %color.풀어쓰기 = 해제
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 모든 색상 스크립을 종료 합니다.
}
alias 말머리 {  if ($1 == $Null) { %color.말머리 = $iif(%color.말머리 == 실행,해제,실행) }
  elseif ($1 != $Null) { %co.말머리 = $1- | %color.말머리 = 실행 } 
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 말머리기능을 %color.말머리 합니다.
} 
alias 말꼬리 { 
  if ($1 == $Null) { %color.말꼬리 = $iif(%color.말꼬리 == 실행,해제,실행)  }
  elseif ($1 != $null) { %co.말꼬리 = $1- | %color.말꼬리 = 실행 }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 말꼬리기능을 %color.말꼬리 합니다. 
}
alias 외계어 { 
  if ($1 == $Null) { %color.외계어 = $iif(%color.외계어 == 실행,해제,실행)  }
  elseif ($1 != $null) { %co.외계어 = $1- | %color.외계어 = 실행 }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ 外ㄱ=lløつ긔능乙 %color.외계어 합느lΣι.
}
alias 풀어쓰기 { 
  if ($1 == $Null) { %color.풀어쓰기 = $iif(%color.풀어쓰기 == 실행,해제,실행)  }
  elseif ($1 != $null) { %co.풀어쓰기 = $1- | %color.풀어쓰기 = 실행 }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ ㅍㅜㄹㅇㅓㅆㅡㄱㅣ ㄱㅣㄴㅡㅇㅇㅡㄹ $dll(hangul.dll,split,$mid(%color.풀어쓰기,1,2)) $+ $dll(hangul.dll,split,$mid(%color.풀어쓰기,3,2)) $+ ㅎㅏㅂㄴㅣㄷㅏ
}
alias 리버스 { 
  if ($1 == $Null) { %color.리버스 = $iif(%color.리버스 == 실행,해제,실행)  }
  elseif ($1 != $null) { %co.리버스 = $1- | %color.리버스 = 실행 }
  sockwrite -tn Zodbot PRIVMSG $chan : $+ .다니합 %color.리버스 을능기스버리
}
alias charselect {
  if (%lots == 1) { set %rangec1 48 | set %rangec2 57 }
  if (%lots == 2) { set %rangec1 97 | set %rangec2 122 }
  if (%lots == 3) { set %rangec1 65 | set %rangec2 90 }
  if (%lots == 4) {
    if ($rand(1,4) == 1) { set %rangec1 33 | set %rangec2 47 }
    if ($rand(1,4) == 2) { set %rangec1 58 | set %rangec2 64 }
    if ($rand(1,4) == 3) { set %rangec1 91 | set %rangec2 96 }
    if ($rand(1,4) == 4) { set %rangec1 123 | set %rangec2 125 }
  }
  if (%lots == 5) {
    if ($rand(1,2) == 1) { set %rangec1 65 | set %rangec2 90 }
    if ($rand(1,2) == 2) { set %rangec1 97 | set %rangec2 122 }
  }
  if (%lots == 6) {
    if ($rand(1,2) == 1) { set %rangec1 48 | set %rangec2 57 }
    if ($rand(1,2) == 2) { set %rangec1 97 | set %rangec2 122 }
  }
  if (%lots == 7) {
    if ($rand(1,3) == 1) { set %rangec1 48 | set %rangec2 57 }
    if ($rand(1,3) == 2) { set %rangec1 97 | set %rangec2 122 }
    if ($rand(1,3) == 3) { set %rangec1 65 | set %rangec2 90 }
  }
  if (%lots == 8) {
    if ($rand(1,7) == 1) { set %rangec1 48 | set %rangec2 57 }
    if ($rand(1,7) == 2) { set %rangec1 97 | set %rangec2 122 }
    if ($rand(1,7) == 3) { set %rangec1 65 | set %rangec2 90 }
    if ($rand(1,7) == 4) { set %rangec1 33 | set %rangec2 47 }
    if ($rand(1,7) == 5) { set %rangec1 58 | set %rangec2 64 }
    if ($rand(1,7) == 6) { set %rangec1 91 | set %rangec2 96 }
    if ($rand(1,7) == 7) { set %rangec1 123 | set %rangec2 125 }
  }
}
alias comgen {
  var %nf = $gettok($1,1,46), %na = $gettok($1,2,46), %n = %nf
  :to 
  var %i = $regsubex(%n,/(\d)(\d{3})$/g,\a), %t = $gettok(%i,0,32)
  if (%t > 1) {
    var %tmp_com = $gettok(%i,2,32) %tmp_com,%n = $gettok(%i,1,32)
    goto to
  }
  else return $replace(%i %tmp_com,$chr(32),$chr(44)) $+ $iif(%na,$+(.,$v1))
}
alias percent { 
  if (!$isid) { echo -a This should called as an Identifer }
  else {
    if ((!$1 && $1 !isnum) || !$2) { return [！] Syntax Error! $!percentage(value,maximum,length) }
    tokenize 32 $1-2 $iif(!$3,100,$3)
    var %used, %result, %i, %tmp, %bg1 = 04, %bg2 = 15, %txt, %percent = $round($calc($1 / $2 * 100),2)
    if ($len($gettok(%percent,2,46)) == 1) { %percent = %percent $+ 0 }
    if (!$prop) {
      %txt = $regsubex($regsubex(%percent $+ $str(-,$calc(6 - $len(%percent))) $+ %,/(\d{1,}\.?\d{1,})--%$/g,-\t-%),/(\d{1,}-{3,})/g,$iif($len($remove(\t,-)) == 1,-) $+ $remove(\t,-) $+ .00-)
    }
    else if ($prop == text) {
      var %len = $iif($len($2) <= 3,3,$calc($len($2) + 1))
      %txt = $+($str(-,$calc(%len - $len($1))),$1,-/-,$2,$str(-,$calc(%len - $len($2))))
    }
    %i = $calc($round($calc($3 / 2),0) - $floor($calc($len(%txt) /2)))
    %tmp = $str(l,%i) $+ %txt
    %tmp = %tmp $+ $str(l,$calc($3 - $len(%tmp)))
    if ($1 >= $calc($2 /3)) { %bg1 = $iif($1 >= $calc($2 * 2/3),03,07) }
    if ($1 > $2) {
      var %bg = 03|12|02|05|10
      var %num = $calc(($floor($calc(($1 - $1 % $2) / $2)) -1) % $numtok(%bg,124) +1)
      %bg1 = $gettok(%bg,$iif($calc(%num + 1) > $numtok(%bg,124),1,$calc(%num + 1)),124)
      %bg2 = $gettok(%bg,%num,124)
      tokenize 32 $calc($1 % $2) $2-3
    }
    %used = $round($calc(($1 / $2) * $3),0)
    %result = $+(,%bg1,$chr(44),%bg1)) $+ $regsubex($left(%tmp,%used),/(\d|\.|%)/g,00\t $+ $+(,%bg1,$chr(44),%bg1)) $+ $+(,%bg2,$chr(44),%bg2) $+ $regsubex($mid(%tmp,$calc(%used + 1)),/(\d|\.|%)/g,00\t $+ $+(,%bg2,$chr(44),%bg2))
    %result = $replace(%result,$+(,%bg1,$chr(44),%bg1,,%bg2,$chr(44),%bg2),$+(,%bg2,$chr(44),%bg2),$+(,%bg1,$chr(44),%bg1,00),)
    return %result
  }
}

alias percent2 { 
  if (!$isid) { echo -a This should called as an Identifer }
  else {
    if ((!$1 && $1 !isnum) || !$2) { return [！] Syntax Error! $!percentage(value,maximum,length) }
    tokenize 32 $1-2 $iif(!$3,100,$3)
    var %used, %result, %i, %tmp, %bg1 = 04, %bg2 = 15, %txt, %percent = $round($calc($1 / $2 * 100),2)
    var %percent2 $1 $+ $chr(46) $+ $2
    if ($len($gettok(%percent2,2,46)) == 1) { %percent2 = %percent2 $+ 0 }
    if (!$prop) {
      %txt = $regsubex($regsubex(%percent2 $+ $str(-,$calc(6 - $len(%percent2))),/(\d{1,}\.?\d{1,})--%$/g,-\t-%),/(\d{1,}-{3,})/g,$iif($len($remove(\t,-)) == 1,-) $+ $remove(\t,-) $+ .00-)
    }
    else if ($prop == text) {
      var %len = $iif($len($2) <= 3,3,$calc($len($2) + 1))
      %txt = $+($str(-,$calc(%len - $len($1))),$1,-/-,$2,$str(-,$calc(%len - $len($2))))      
    }
    %i = $calc($round($calc($3 / 2),0) - $floor($calc($len(%txt) /2)))
    %tmp = $str(l,%i) $+ %txt
    %tmp = %tmp $+ $str(l,$calc($3 - $len(%tmp)))
    if ($1 >= $calc($2 /3)) { %bg1 = $iif($1 >= $calc($2 * 2/3),03,07) }
    if ($1 > $2) {
      var %bg = 03|12|02|05|10
      var %num = $calc(($floor($calc(($1 - $1 % $2) / $2)) -1) % $numtok(%bg,124) +1)
      %bg1 = $gettok(%bg,$iif($calc(%num + 1) > $numtok(%bg,124),1,$calc(%num + 1)),124)
      %bg2 = $gettok(%bg,%num,124)
      tokenize 32 $calc($1 % $2) $2-3
    }
    %used = $round($calc(($1 / $2) * $3),0)
    %result = $+(,%bg1,$chr(44),%bg1)) $+ $regsubex($left(%tmp,%used),/(\d|\.|%)/g,00\t $+ $+(,%bg1,$chr(44),%bg1)) $+ $+(,%bg2,$chr(44),%bg2) $+ $regsubex($mid(%tmp,$calc(%used + 1)),/(\d|\.|%)/g,00\t $+ $+(,%bg2,$chr(44),%bg2))
    %result = $replace(%result,$+(,%bg1,$chr(44),%bg1,,%bg2,$chr(44),%bg2),$+(,%bg2,$chr(44),%bg2),$+(,%bg1,$chr(44),%bg1,00),)
    return $replace(%result,$chr(46),$chr(47))
  }
}

alias cmask {
  var %i 1
  var %mcount 0
  var %mask $remove($1,$chr(35))
  var %masklen $len(%mask)
  if (%masklen >= 4) {
    while () {
      if ($asc($mid(%mask,%i,1)) > 128) { inc %i | var %mcount 1 }

    }
  }
  else {
    var %masked $chr(35) $+ $mid(%mask,1,1) $+ $str($chr(42),%masklen)
    if (%masklen == 1) { var %masked $chr(35) $+ $chr(42) }
  }
  return %masked
}
alias acconv {
  var %dcalc $calc(100-(($1 + 200)/20)^2))
  var %dam1 $2
  var %damre $int( $calc(%dam1 - (%dam1 * (%dcalc / 100) ) ) )
  return $int(%damre)
}
alias dec2bqox {
  if ($exists(div_tmp.txt)) { remove div_tmp.txt }
  if (!$1) {
    return 변환할숫자와 진법을 입력하여 주십시요. (ex : $chr(36) $+ dec2bqo(100,bin))
    halt
  }
  if ($1 !isnum) {
    return $1 $+ 은(는) 올바른 숫자가 아닙니다. 다시 확인하여 주십시요.
    halt
  }
  if (!$2) {
    return 몇진법으로 환산하실것인지 입력하여 주십시요.
    halt
  }
  if ($1 > 100000000000000000000) {
    return 숫자가 너무 큽니다. 다시 입력하여 주십시요.
    halt
  }
  if ($2 == bin) { goto narycalc } | if ($2 == qua) { goto narycalc } | if ($2 == oct) { goto narycalc } | if ($2 == hex) { goto narycalc }
  else { 
    return $2 $+ 은(는) 변환할수 없는 진법입니다.
    return bin : 2진수, qua : 4진수, oct : 8진수, hex : 16진수 (ex : $chr(36) $+ dec2bqo(100,bin))
    halt
  }
  :narycalc
  var %i 0
  var %divider $1
  var %nary = $replace($2,bin,2,qua,4,oct,8,hex,16)
  :div
  write div_tmp.txt $calc(%divider % %nary)
  if (%divider > 1) {
    var %divider = $int($calc(%divider / %nary))
    inc %i
    goto div
  }
  var %q 0
  while (%q < $lines(div_tmp.txt)) {
    if (%nary == 16) {
      var %div_result = %div_result $+ $replace($read(div_tmp.txt,%q),10,A,11,B,12,C,13,D,14,E,15,F)
    }
    if (%nary != 16) {
      var %div_result = %div_result $+ $read(div_tmp.txt,%q)
    }
    inc %q
  }
  remove div_tmp.txt
  return $reverse(%div_result,%div_result)
}
alias defcalc {
  var %i -200
  write defence.txt 방어력 계산 (기준 데미지 : 1,000,000)
  while (%i <= 100) {
    var %dcalc = $calc(100-((%i + 200)/20)^2))
    var %dam1 1000000
    var %damre = $int($calc(%dam1 - (%dam1 * (%dcalc / 100))))
    write defence.txt 방어력 : %i , 데미지 감소율 : %dcalc $+ $chr(37) , 적용데미지 : %damre
    inc %i
  }
}
alias rvnum {
  var %cnt = 1
  if ($len($1-) <= 0) { halt }
  while (%cnt <= $len($1-)) {
    if ( $asc($mid($1-,%cnt,1)) < 48 || $asc($mid($1-,%cnt,1)) > 57) {
      return $mid($1-,%cnt)
      echo -a $mid($1-,%cnt)
    }
    inc %cnt
  }
}
alias sremover {
  var %i 1
  if ($len($1-) <= 0) { halt }
  while (%i <= $len($1-)) {
    if ($mid($1-,%i,1) != $chr(32)) {
      return $mid($1-,%i)
      echo -a $mid($1-,%i)
    }
    inc %i
  }
}

alias lotremove {
  var %i 1
  while (%i <= $ini(tmp_exp.ini,돈,0)) {
    if ($readini(tmp_exp.ini,돈,$ini(tmp_exp.ini,돈,%i)) < 1000000) {
      remini tmp_exp.ini 돈 $ini(tmp_exp.ini,돈,%i)
    }
    inc %i
  }
}
alias expcalc {
  if ($exists(tmp_exc.txt)) { remove tmp_exc.txt }
  if ($exists(tmp_exh.txt)) { remove tmp_exh.txt }
  if (!$1) { return 체력 또는 마력을 입력하여 주십시요. | halt }
  if (!$2) { return 직업을 입력하여 주십시요. | halt }
  if (!$3) { return 체력/마력을 구분하여 주십시요. | halt }
  if ($1 == $chr(48)) { return 이상한 수 넣으면 뒤진다? ㅡㅡ | halt }
  var %health $1
  var %jobs $readini(expcalc.ini,직업,$2)
  var %i 0
  var %j 1
  var %k 1
  var %q 0
  var %health2 %health
  if (%jobs == 1) {
    if ($3 == 체력) {
      var %jsel1 격수체력1
      var %jsel2 격수체력2
      var %div 50
    }
    if ($3 == 마력) {
      var %jsel1 격수마력1
      var %jsel2 격수마력2
      var %div 25
    }
  }
  if (%jobs == 2) {
    if ($3 == 체력) {
      var %jsel1 비격체력1
      var %jsel2 비격체력2
      var %div 50
    }
    if ($3 == 마력) {
      var %jsel1 비격마력1
      var %jsel2 비격마력2
      var %div 25
    }
  }
  while (%health2 > 0) {
    var %health2 = $calc(%health2 - ($readini(expcalc.ini,%jsel1,%j)*10^4))
    if (%health2 > 0) { write tmp_exc.txt $calc($readini(expcalc.ini,%jsel1,%j)*10^4) | inc %i | inc %j }
    else { write tmp_exc.txt $calc(%health2 + ($readini(expcalc.ini,%jsel1,%j)*10^4)) | inc %i }
  }
  write tmp_exh.txt 0
  while (%k <= %i) {
    var %kp $calc(%k - 1)
    if (%k == 12 && jobs == 1 && %jsel1 == 격수체력1) { var %div 20 }
    if (%k == 13 && jobs == 1 && %jsel1 == 격수체력1) { var %div 10 }
    if (%k == 12 && jobs == 1 && %jsel1 == 격수마력1) { var %div 10 }
    if (%k == 13 && jobs == 2 && %jsel1 == 비격체력1) { var %div 20 }
    write tmp_exh.txt $calc($read(tmp_exc.txt,%kp) * ($readini(expcalc.ini,%jsel2,%k)*10^6) / %div)
    inc %k
  }
  while (%q <= $lines(tmp_exh.txt)) { var %result = $calc(%result + $read(tmp_exh.txt,%q)) | inc %q }
  return %result
}
alias calen {
  if (!$2) { 
    echo -a 아래 형식처럼 입력해주세요.
    echo -a //cal $asctime(yyyy m) 
    return
  }
  elseif (!$asctime($ctime($1 $+ / $+ $2 $+ /1),ddd)) {
    privmsg $gettok(%Zodbot.data,3,32) $1 $+ 년 $2 $+ 월은 현재기준으로 지원되지 않는 날짜입니다.
    return
  }
  unset %Cal*
  set %Cal_y $1
  set %Cal_m $right($+(0,$2),2)
  privmsg $gettok(%Zodbot.data,3,32) $+(,$color(action)) ▒ $$1 $+ 년 $+ $+(,$color(action)) $$2 $+ 월 $+(,$color(action)) $+ ▒ 
  privmsg $gettok(%Zodbot.data,3,32) 4 일 월 화 수 목 금 12토
  var %n = $Cal_day($asctime($ctime($1 $+ / $+ $2 $+ /1),ddd))
  var %1w = $iif(%n,$+(,$color(back)) $str($chr(32) $+ 00,%n) $+ ) $iif(%n == 1,01 02 03 04 0512 06,$iif(%n == 2,01 02 03 0412 05,$iif(%n == 3,01 02 0312 04,$iif(%n == 4,01 0212 03,$iif(%n == 5,0112 02,$iif(%n == 6,12 01,4 01 02 03 04 05 0612 07)))))))
  set %Cal_Sat $ctime($1 $+ / $+ $2 $+ / $+ $gettok(%1w,$numtok(%1w,32),32))
  var %2w = 4 $Cal_dd(1) $+  $Cal_dd(2) $Cal_dd(3) $Cal_dd(4) $Cal_dd(5) $Cal_dd(6) $+ 12 $Cal_dd(7)
  var %3w = 4 $Cal_dd(8) $+  $Cal_dd(9) $Cal_dd(10) $Cal_dd(11) $Cal_dd(12) $Cal_dd(13) $+ 12 $Cal_dd(14)
  var %4w = 4 $Cal_dd(15) $+  $Cal_dd(16) $Cal_dd(17) $Cal_dd(18) $Cal_dd(19) $Cal_dd(20) $+ 12 $Cal_dd(21)
  var %5w = $iif($Cal_dd(22),4 $Cal_dd(22) $+ ) $Cal_dd(23) $Cal_dd(24) $Cal_dd(25) $Cal_dd(26) $iif($Cal_dd(27),$Cal_dd(27) $+ 12) $Cal_dd(28)
  var %6w = $iif($Cal_dd(29),4 $Cal_dd(29) $+ ) $Cal_dd(30) 
  privmsg $gettok(%Zodbot.data,3,32) %1w
  privmsg $gettok(%Zodbot.data,3,32) %2w
  privmsg $gettok(%Zodbot.data,3,32) %3w
  privmsg $gettok(%Zodbot.data,3,32) %4w
  if (%5w) { privmsg $gettok(%Zodbot.data,3,32) %5w }
  if (%6w) { privmsg $gettok(%Zodbot.data,3,32) %6w }
  unset %Cal*
}
alias -l Cal_dd {
  if (!%Cal_01) {
    var %dd = $asctime($calc(%Cal_Sat + (86400 * $1)),dd)
    if (%dd == 01) { set %Cal_01 ON }
    else { 
      if ($date == %dd $+ / $+ %Cal_m $+ / $+ %Cal_y) { return $+(,%dd,) }
      else { return %dd }
    }
  }
}
alias starkey {
  var %i 1
  var %checksum 3
  while (%i <= 12) {
    var %scal1 $calc(2 * %checksum)
    var %scal2 $xor(%scal1,$mid($1,%i,1))
    var %checksum $calc(%checksum + %scal2)
    inc %i
  }
  var %checksum $calc(%checksum % 10)
  return %checksum
}
alias -l Cal_day {
  if ($1 == Sat) { return 6 }
  elseif ($1 == Fri) { return 5 }
  elseif ($1 == Thu) { return 4 }
  elseif ($1 == Wed) { return 3 }
  elseif ($1 == Tue) { return 2 }
  elseif ($1 == Mon) { return 1 }
  else { return 0 }
}
alias urlencode {
  return $regsubex($1-,/\G(.)/g,$iif(($prop && \1 !isalnum) || !$prop,$chr(37) $+ $base($asc(\1),10,16),\1))
}
alias urldecode {
  return $replace($regsubex($1-,/%(\w\w)/g,$chr($iif($base(\t,16,10) != 32,$v1,1))),$chr(1),$chr(32))
}
alias latindic { cmd words.exe $$1- }
alias netstat { cmd netstat $1- }
alias ipconfig { cmd ipconfig $1- }
alias ver { cmd ver }
alias ping1 { cmd ping $$1- }
alias cmd {
  echo $color(info2) -a * $iif($1 == ver,Window Version,$iif($1 == ipconfig,IP-Config,$iif($1 == netstat,Netstat,PING))) 데이터를 불러오는 중입니다.
  var %x = $ticks,%p = $2-,%f = c:\ $+ $1 $+ %x $+ .txt 
  if ($com($1 $+ %x)) { .comclose $1 $+ %x } 
  .comopen $1 $+ %x WScript.Shell
  if !$comerr { .comclose $1 $+ %x $com($1 $+ %x,Run,3,bstr,$+(%,comspec%) /c $1 %p > %f,uint,0,bool,true) }
  ;==============<!본인의 스타일로 편집가능한 부분입니다!>
  loadbuf -a %f
  ; echo -a _
  ; echo -a Duration: $ms($calc($ticks - %x))
  beep
  ;==============<!여기까지만 편집하세요!>
  .remove %f
}
alias -l ms { return $duration($left($1,-3)) $iif($int($right($1,3)),$ifmatch $+ ms) }
alias ceil1 { return $iif($numtok($1,46) == 2 && $gettok($1,2,46) > 1,$calc($gettok($1,1,46) + 1),$gettok($1,1,46) }
Alias nickdt {
  Var %a = $+($Chr(0),-,$Chr(127))
  Var %Nick_Dot_Tmp = $Regex($1, ([[ %a ]]*)(.+)|([^[ %a ]]*.)(.+))
  Return $IIF($Regml(0),$+($Regml(1),·,$Regml(2)),$1)
}
alias timeoutoff {
  timertimeout off
  timertimeout2 off
}
alias timeout {
  timertimeout 1 $$1 privmsg $$2 연결제한시간 초과입니다. 잠시후 다시 시도해주세요. (Request Time-out)
  timertimeout2 1 $$1 sockclose $$3
}
alias 좆같음지수 {
  var %per $rand(1,100)
  if (%좆같음지정 == 1) { var %per 100 | set %좆같음지정 2 }
  var %i 0
  if ($len(%per) == 1) { var %per 0 $+ %per }
  while (%i < 10) {
    if (%per == 100) { var %botchart ■■■■■■■■■■ | var %i 11 }
    if (%per != 100) {
      if ($mid(%per,1,1) > %i) { var %botchart %botchart $+ ■ }
      else { var %botchart %botchart $+ □ }
    }
    inc %i
  }
  if (%per isnum 1-10) { set %좆느낌 쾌적함 }
  if (%per isnum 10-20) { set %좆느낌 그닥 좆같지 않음 }
  if (%per isnum 20-30) { set %좆느낌 약간 좆같음 }
  if (%per isnum 30-40) { set %좆느낌 좆같은듯, 안좆같은듯 함 }
  if (%per isnum 40-50) { set %좆느낌 슬슬 좆같기 시작함 }
  if (%per isnum 50-60) { set %좆느낌 좆같음 }
  if (%per isnum 60-70) { set %좆느낌 아~ 슈ㅣ발! 좆같음!!~! }
  if (%per isnum 70-80) { set %좆느낌 슈ㅣ발 절라 좆같음! }
  if (%per isnum 80-90) { set %좆느낌 이런 개씨발 좆같은 경우를 봤나!!! }
  if (%per isnum 90-99) { set %좆느낌 4야이 개씨발 샛퀴들아!!1 }
  if (%per == 100) { set %좆느낌 4야이 개씨발 $read(slangcombo.txt) $+ !!! 아~ 슈ㅣ발! 절라 좆같네!!~!1 }
  set %좆같음 %botchart
  set %좆같음per %per
}
alias unicode_utf8 returnex $regsubex(uniutf, $iif($isutf($1), $1, $utfencode($1)), /U\+([0-9A-F]{1,6})/g, $bin_utf8($base(\t, 16, 2, 21)))
alias -l Socket_Close { 
  if (</HTML> isin %temp) { sockclose $$1 | unset %temp | halt } 
} 
alias -l Socket_Filter { 
  var %x, %i = $regsub($1-,/(^[^<]*>|<[^>]*>|<[^>]*$)/g,$null,%x), %x = $remove(%x,&nbsp;) 
  return %x 
}
alias durakor {
  var %x $replace($duration($1),mins,분,min,분,secs,초,sec,초)
  return %x
}
alias meatspin {
  inc %spin
  if (%spin == 1) { privmsg %spinchan %spintarget have sat through %spin spin! }
  else { privmsg %spinchan %spintarget have sat through %spin spins! }
  if (%spin == 10) { privmsg %spinchan 4 $+ %spintarget is officially gay :-) }
}
alias amgine {
  if (!$1) { return Need a parameter }
  if ($len($1) != 9) { return 자리수가 맞지 않음. (9자리) }
  var %i 1
  while (%i <= 9) {
    var %zhash $calc($mid($1,%i,1) + %zhash)
    inc %i
  }
  if ($len(%zhash) == 2) { var %zhash $chr(48) $+ %zhash }
  set %zorigin $1 $+ %zhash
  var %zpattern $rand(1,$ini(amgine.ini,0))
  var %i 1
  while (%i <= 12) {
    var %zresult = %zresult $calc((($mid(%zorigin,%i,1) + $readini(amgine.ini,%zpattern,%i)) * $readini(amgine.ini,%zpattern,%i)) % 36)
    inc %i
  }
  var %zresult $remove($replace(%zresult,10,A,11,B,12,C,13,D,14,E,15,F,16,G,17,H,18,I,19,J,20,K,21,L,22,M,23,N,24,O,25,P,27,Q,28,R,29,S,30,T,31,U,32,V,33,W,34,X,35,Y,36,Z),$chr(32))
  var %zresult $left(%zresult,3) $+ $chr(45) $+ $mid(%zresult,4,6) $+ $chr(45) $+ $right(%zresult,3)
  return Supervision No. : $mid(%zorigin,7,3) / Quater : $mid(%zorigin,5,2) / Input : %zorigin / Serial : %zresult / Pattern : %zpattern
}
alias pat_gen {
  var %i 1
  var %j 1
  while (%i <= 1000) {
    while (%j <= 12) {
      writeini -n amgine.ini %i %j $rand(1,36)
      inc %j
    }
    inc %i
    var %j 0    
  }
}
alias blueblue {
  var %i 3
  while (%i <= $calc($ini(cityi.ini,0) - 2)) {
    ; remini -n cityi.ini $ini(cityi.ini,%i) 자경단
    writeini -n cityi.ini $ini(cityi.ini,%i) 건물제한 $rand(30,250)
    ; writeini cityi.ini $ini(cityi.ini,%i) 별장 $int($calc($readini(cityi.ini,$ini(cityi.ini,%i),호텔) * 0.1))
    ; writeini cityi.ini $ini(cityi.ini,%i) 기본료 $int($calc($readini(cityi.ini,$ini(cityi.ini,%i),가격) / 1000))
    inc %i
  }
}
alias blue2 {
  var %i 1
  while (%i <= $lines(final.txt)) {
    var %price $rand(1000000,9999999)
    var %hprice $rand(100000,999999)
    writeini cityt.ini $read(final.txt,%i) 가격 %price
    writeini cityt.ini $read(final.txt,%i) 호텔 %hprice
    writeini cityt.ini $read(final.txt,%i) 빌딩 $int($calc(%hprice * 0.5))
    writeini cityt.ini $read(final.txt,%i) 별장 $int($calc(%hprice * 0.1))   
    writeini cityt.ini $read(final.txt,%i) 호 0    
    writeini cityt.ini $read(final.txt,%i) 빌 0
    writeini cityt.ini $read(final.txt,%i) 별 0    
    writeini cityt.ini $read(final.txt,%i) 기본료 $int($calc(%price / 1000))
    writeini cityt.ini $read(final.txt,%i) 건물제한 $rand(30,250)    
    inc %i
  }
}
