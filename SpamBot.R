#=============================================================================#
#  The purpose of this program was to spam the shit out of Ryan Arnold        #
#  It requires the gmailr package                                             #
#  It also might get you locked out of Google.                                #
#  The spam_bot function requires a from email string, and a to email string  #
#  The default time is 1 minute, but that parmeter can be overridden.         #
#  Testing shows the program to send between 85 and 100 emails per minute.    #
#  The function randomly calls subject lines and email bodies from embedded   #
#  libraries that can be modified as needed.                                  #
#  The function employs a while loop to coninuously send emails for the       #
#  specified time.                                                            #
#=============================================================================#

library(gmailr)


spam_bot <- function(from.email, to.email, minutes = 1){
  subject_lines <- c("Important Work Related Message", "RE: A Big Gift", "Need to set up a meeting", "DC Event",
                     "Question about Pittsburgh", "Do you ever ask yourself 'Why me?'", "What Ann Arbor Singles Are Doing
                     is Going to SHOCK YOU", "We thought your inbox looked a little lonely", "New IPhones in YOUR Area",
                     "Quick question about a prospect", "Important Security Update Regarding Your Account", "Philadelphia Prospect List Please Review",
                     "TIME SENSITIVE: Gift Agreement Processing for CY2017", "URGENT: Major Gifts Conference Call for Northeast Region",
                     "ACTION NEEDED: Proposal Draft", "Free Pizza in the Kitchen!", "To whoever left their lunch in the fridge..it has grown legs",
                     "PASSED DEADLINE: To complete before end of calendar year", "Ryan we know what you did", "Re: Returned Expense Report",
                     "Reminder to submit certification form before EOD 12/22/16", "Re: Re: Re: Re: Re: Re: Re: Re: Re: Pittsburgh")
  bodies <- c("You are receiving this message because your co-workers are jerks.", "Sorry, this still isn't real",
                 "Did you open this? Oops.", "The great philosopher Robert The Carpenter (aka Bob the Builder) once asked the
              immortal question 'can we build it?'. The answer is 'yes we can'. So what we build was an email tool that will
              just email you continuously for some pre determined span of time. Several of your co-workers agreed that this was a
              good idea. This is the fall out of that decision.", "I'm kind of sorry. This is going to send a lot of emails.", 
              "The chances of your receiving emails in a particular order is low, but I apologized about this being a lot of emails,
              but they are still coming.", "My initial estimate puts the emails at around 100 per minute. I wonder how long I set the
              timer for?", "We aren't bad people. Just misguided.", "Enjoy your vacation! Try not to work too hard!", 
              "This isn't the work related email you're looking for. *Waves hand at storm trooper", "Call me Ishmael. Some years ago -- 
              never mind how long precisely -- having little or no money in my purse, and nothing particular to interest me on shore, 
              I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen, 
              and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November 
              in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral 
              I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me 
              from deliberately stepping into the street, and methodically knocking people's hats off -- then, I account it high time to get 
              to sea as soon as I can. This is my substitute for pistol and ball. With a philosophical flourish Cato throws himself upon his sword; 
              I quietly take to the ship. There is nothing surprising in this. If they but knew it, almost all men in their degree, some time or other, 
              cherish very nearly the same feelings towards the ocean with me.", "It was while gliding through these latter waters that one serene and 
              moonlight night, when all the waves rolled by like scrolls of silver; and, by their soft, suffusing seethings, made what seemed a silvery 
              silence, not a solitude: on such a silent night a silvery jet was seen far in advance of the white bubbles at the bow. Lit up by the moon, 
              it looked celestial; seemed some plumed and glittering god uprising from the sea", "Already several fatalities had attended his chase. 
              But though similar disasters, however little bruited ashore, were by no means unusual in the fishery; yet, in most instances, such seemed 
              the White Whale's infernal aforethought of ferocity, that every dismembering or death that he caused, was not wholly regarded as having been inflicted by an unintelligent agent.
              Judge, then, to what pitches of inflamed, distracted fury the minds of his more desperate hunters were impelled, when amid the chips of chewed boats, 
              and the sinking limbs of torn comrades, they swam out of the white curds of the whale's direful wrath into the serene, exasperating sunlight, that smiled on, as if at a birth or a bridal.
              His three boats stove around him, and oars and men both whirling in the eddies; one captain, seizing the line-knife from his broken prow, had dashed at the whale, 
              as an Arkansas duellist at his foe, blindly seeking with a six inch blade to reach the fathom-deep life of the whale. That captain was Ahab. And then it was, 
              that suddenly sweeping his sickle-shaped lower jaw beneath him, Moby Dick had reaped away Ahab's leg, as a mower a blade of grass in the 
              field.... Small reason was there to doubt, then, that ever since that almost fatal encounter, Ahab had cherished a wild vindictiveness 
              against the whale, all the more fell for that in his frantic morbidness he at last came to identify with him, not only all his bodily woes, 
              but all his intellectual and spiritual exasperations. The White Whale swam before him as the monomaniac incarnation of all those malicious 
              agencies which some deep men feel eating in them, till they are left living on with half a heart and half a lung. That intangible malignity 
              which has been from the beginning; to whose dominion even the modern Christians ascribe one-half of the worlds; which the ancient Ophites 
              of the east reverenced in their statue devil; -- Ahab did not fall down and worship it like them; but deliriously transferring its idea 
              to the abhorred white whale, he pitted himself, all mutilated, against it. All that most maddens and torments; all that stirs up the lees 
              of things; all truth with malice in it; all that cracks the sinews and cakes the brain; all the subtle demonisms of life and thought; all 
              evil, to crazy Ahab, where visibly personified, and made practically assailable in Moby Dick. He piled upon the whale's white hump the sum 
              of all the general rage and hate felt by his whole race from Adam down; and then, as if his chest had been a mortar, he burst his hot heart's shell upon it.",
              "https://www.youtube.com/watch?v=dQw4w9WgXcQ", "https://www.youtube.com/watch?v=g-sgw9bPV4A", "https://www.youtube.com/watch?v=J1c2KzJbcGA",
              "https://www.youtube.com/watch?v=q6EoRBvdVPQ", "https://www.youtube.com/watch?v=ZZ5LpwO-An4", "https://www.youtube.com/watch?v=SW-BU6keEUw",
              "https://www.youtube.com/watch?v=thyJOnasHVE", "https://www.youtube.com/watch?v=SCUMFkfOPnU",
              "Richard Morgan Fliehr[6] (born February 25, 1949), better known as Ric Flair,[7] is an American professional wrestling manager and semi-retired 
              professional wrestler signed to WWE under its Legends program.

              Considered by many to be the greatest professional wrestler of all time,[8][9] he has cultivated a legacy over a career that spans 40 years. 
              Flair is noted for his tenures with the National Wrestling Alliance (NWA), World Championship Wrestling (WCW), the World Wrestling Federation 
              (WWF, later WWE), and Total Nonstop Action Wrestling (TNA). Since the mid-1970s, he has used the moniker, the 'Nature Boy'.
              
              Flair is officially recognized by WWE and Pro Wrestling Illustrated (PWI) as a 16-time world champion (eight-time NWA World Heavyweight Champion, 
              six-time WCW World Heavyweight Champion, and two-time WWF Champion),[10][11] although the actual number of his world championship reigns varies 
              by source, ranging from 16 to 25.[12] A major pay-per-view attraction throughout his career, Flair main-evented the premier annual NWA/WCW event, 
              Starrcade, on ten occasions; he also co-headlined its WWF counterpart, WrestleMania, in 1992.[13] PWI awarded Flair their Wrestler of the Year award 
              a record six times, while Wrestling Observer Newsletter named Flair as the Wrestler of the Year (an award named after him and Lou Thesz) on a record 
              of nine occasions. The only two-time WWE Hall of Fame inductee in history, first inducted in 2008 for his individual career and for a second time in 
              2012 as a member of The Four Horsemen, Flair is also an NWA Hall of Famer. In WCW, he also had two stints as a booker: from 1989–1990 and again in 1994.[14]
              
              Flair was the first titleholder of both the WCW World Heavyweight Championship and the WCW International World Heavyweight Championship 
              (as well as the final holder of the latter title). In being the inaugural WCW World Heavyweight Champion, he also became the first WCW's 
              Triple Crown Champion, having already held the United States Heavyweight and World Tag Team Championships. He then completed WWE's version 
              of the Triple Crown when he won the Intercontinental Championship, after already holding the WWF Championship and the World Tag Team Championship. 
              Using the officially recognized totals (by WWE and PWI) of 16 world championships and six United States Heavyweight Championship reigns, Flair 
              has won a total of 31 different major championships between the NWA, WCW, and WWF/WWE, with numerous regional titles also to his credit.",
              "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''++++
''''''''''''''''''''''''''''''''''''''''''''''''''''''';''''''''''''''''''''''''''''''''''''''''''''+++++
              '''''''''''''''''''''''''''''''''''''';'''''''''''''''';;';'''';'''''';;'''''';''''''''''''''''''+'++++++
              '''''''''''''''''''''''''''''''''''''';;'''''''''''''''';';'''';''''''';'''''''''''''''''''''''''+'++++++
              ''''''''''''''''''''''''''''''''''''''';'''';'''';;;;;;;;;;;''';;'';;''';'''''''''''''''''''''''''+++++++
              ''''''''''''''''''''''''''''''''';''''''';'';;;;:::::::::;;;;''';;;;;;;;;'''''''''''''''''''''''''+++++++
              ''''''''''''''''''''''''''''''''';'''';';;;;;::::::::::,,:::;''';;;;;;;;;;''''''''''''''''''''+''++++++++
              '''''''''''''''''''''''''';'''''';''''';;;;;;;::::::::,,,,,:::;';;;;;;;;;;;;'';''''''''''''''''''++++++++
              '''''''''''''''''''';''';';''''''';;'';;;;;::::::::::,,,,,,,,,::;;;;;;;;;;''''';;'''''''''''''''+'+++++++
              '''''''''''''''''';;;;;;;;';;;''';;';;;;;:::::::,,,,,,,,,,,,,,,:::;;;;;;;;;;;;'';;'''''''''''''''++++++++
              '''''''''''';;'';';;;;;;;;;';;'';'';;;;;::::::,,,,,,,,,,,,,,,,,,,::;;;;;;;;'';;;;;'''''''''''''''++++++++
              ''''''''''''';;;;;;;;;';;;;';;;;'';;;;::::::,,,,,,,,,,.,.,,,,,,,,,::;;'';;;;'';;;';'''''''''''''''''+++++
              ''''''''''''';;;;;;;;;;;;;;;;;'';;;;;::::::,,,,,,,,,,,,.....,,,,,,,::;;'';;;;'';;'''''''''''''''''''+++++
              '''''''''''';;;;;;;;;;;;;;;;;'';;;;;;:::::,,,,,,,,,,.,.......,,,,,,,::;;;;;;;';;;'''''''''''''''''''+++++
              ''''';;;;'';;;;;;';;;;;;;;;;'';;;;;:::::::,,,,,,,,,,,...........,,,,,::;;;;';;;;;;'''''''''''''''''''++++
              ''''';;;;;;;;;;;;;;;;;;;;;;'';;;;;;:::::,,,,,,,,,,,..............,,,,,::;;;';';;;;''''''''''''''''''''+++
              '''';;;;;;;;;;;;;;;;;;;;;;;';;;;;;;;:::::::,,,,,,,................,,,,,,:;;;;';;;;;'''''''''''''''''++''+
              '''';;;;;;;;;;;;;;;;;;;;;;'';;;;;;:::::::,,,,,,,....................,,,,,:;;;';;;;;''''''''''''''''''''''
              '''';;;;';;;;;;;;;;;;;;;;';';;;:::::::::,,,,,,,,.,...................,,,,,:;;';;;;;;;''''''''''''''''''''
              '';;;;;;;;;;;;;;;;;;;;;;;'';;;::::::::::::,,,,,,.....................,,,,,:;;;;;';;;;;'''''''''''''''''''
              ''';;;;;;;;;;;;;;;;;;;;;''';;;:::::::::::,,,,,,.......................,,,,,:;;;;;;;'';;;'''''''''''''''''
              ;;;;;;;;;;;;;;;;;;;;;;;;'';;;:;::::::::::,,,,,,...........````.........,,,,,;;;;;;''''';;';;;''''''''''''
              ';;;;;;;;;;;;;;;;;;;;;:''';;;:;:::::::::,,,,,,.,.......`.```````.......,,,,,:;;;;'''';;;;;'';''';''''''''
              ;;;;;;;;;;;;;;;;;;;;;;;'';;;;:;:::::::::,,,,,,,........``````.```.......,,,,,;;;;;;;;;;;;;;;;''';''''''''
              ;;;;;';;;;;;;;;;;;;;;;:''';;;:;::::::::,,,,,,,,........`..```````........,,,,:;;;;;;;;;;;;;';;';;''''''''
              ;;;;;;;;;;;;;;;;;;;;;;''';;;;::::::::::,,,,,,,,,............``..`.......,.,,,:;;;;;;;;;;;;;;;;;;;''''''''
              ;;;;;;;;;;;;;;;;;;;;;;''';;;;;::::::,,,,,,,,,,,,............`.............,,,,;;;;;;;;;;;;;;;;;;;;'''''''
              ;;;;;;;;;;;;;;;;;;;;;;''';;;;:::::::,,,,,,,,,,,..............`.............,,,:;;;;;;;;;;;;;;;;;;;'''''''
              ;;;;;;;;;;;;;;;;;;;;;;''';;;;;:;;;:::,,,,,,,,,,............................,,,:;;;;;;;;;;;;;;;;;;;'''''';
              ;;;;;;;;;;;;;;;;;;;;:;''';;;;;:;;;:::,,,,,,,,,,............................,,,,;;;;;;;;;;;;;;;;;;;'''';';
              ;;;;;;;;;;;;;;;;;;;;:'''';;;;;;;;;;::,,,,,,,,,,,...........................,,,,;;;;;;;;;;;;;;;;;;;;'';;''
              ;;;;;;;;;;;;;;;;;;;;:'''';;;;;;;;;;::,,,,,,,,,,,...........................,,,,;;;;;;;;;;;;;;;;;;;;''''''
              ;;;;;;;;;;;;;;;;;;;::'''';;;;;;;;;;:::,,,,,,,,,................``..........,,,,:;;;;;;;;;;;;;;;;;;;;;;'';
              ;;;;;;;;;;;;;;;;;;;::'''';;;;;;;;;;::,,,,,,,,,,,...........................,,,,:;;;;;;;;;;;;;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;;;;::''''';;;;;;;;;:::::,,,,,,,,,..........................,,,,:;;;;;;;;:;;;;;;;;;;;;;;''
              ;;;;;;;;;;;;;;;;;::::''''';;;;;;;;;::'';;:::,:::,,............,,,,.,,,,,,,.,,,,:;;;;;;;;:;;;;;;;;;;;;;;''
              ;;;;;;;;;;;;;;;:;::::';''';;;;;;;';;++''''+++'';;;::,,,......::;;;;;;:::;;:,,,,:;;;;;;;;;;::;;;;;;;;';;';
              ;;;;;;;;;;;;;;;;:;;;;';'''';;;;;;''++++++++++++++''';:,,..,,,:;';'''+';;;'::,,,:;;;;;;;;;:::;;;;;;;;;;;;;
              ;;;;;;;;;;;;;;;;;';;;+';'''';';;;'##++';;;;'+##++'+';,,,..,,,;''''''';'';;'',,,::;;;;;;:::::;;;;;;;;;;;;'
              ;;;;;;;;;;;;;;;:'+;:;;''+''';;;;;++''';;:,,,:;'+'''':,,,,..,:;'''';::,:,:;+':,,::,,:;;;::::::;;;;;;;;;;;'
              ;;;;;;;;;;;;:;::'+';;;+'++'';;';'++'';;:::;';'';;;'';:,,...,:::;::,,.,,.,::':,,,:.,:;;::::::;;;;;;;;;;;;'
              ;;;;;;;;;;;;::::'';;'''+#+'';;'''+'';;;+##@@#++:';;';:,....,:::;;;;:;;:,,,,:;,,:;.,:;;::::::;;;;;;;;;;;;;
              ;;;;;;;;;;;::;:;'';;';'+##'';';;;;;;;'##+#+@:',':;;'';,,...,,:;;+####';':,,,;::;:,::;;::::::;;;;;;;;;;;;;
              ;;;;;;;;;;;:::;;'';:;'''##''';';;;;;'';::::;;;::'':;;;,,...,,,;;'##:+:++',,,,:,':,,;;;::::::::;;;;;;;;;;;
              ;;;;;;;;;;;:::::;;;:;;''##''';;;::::::::,,.....,,,,:;;:,.....,::;'+':::,::,,,,,':.,;;;;::::::;;;;;;;;;;;;
              ;;;;;;;;;;;;;:::;;:;;++'##''';;::::::,,,,,,,,,.,,,::;;,....,..,,,,,,,....,,...,',..:;;;::::::;;;;;;;;;;;;
              ;;;;;;;;;;:;;::;';:;'++'#+''';;::,,,,::::::,,,,,,,::;;,,...,..,,,:,,..........,;,,,;;:::::::;:::;;;;;;;;;
              ;;;;;:;;;;::::::;:;'++#'#+''';;::,,,,,,,,,,,,,,,,,::;::,..,....,,:,,,,,.,.....,:,,,:;:::::::;;::;;;;;;;;;
              ;;;;;:;;;:::::::;:;'+++;#+''';;::,,,,,,,,,,,,,,,,,::;::,..,,......,,,,,.......,:,.:::::::::::::::;;;;;;;;
              ;;;;::;;::::::::;;;;+++;##''';;::,,,,,,,,,,.,,,,,,,::::,...,..................,,,.::::::::::::::::;;;:;;;
              ;;;:::::::::::::;;;;+++;##+'';;:::,,,,,,.,...,,,,,,::::,...,..................,,,.,:::::::::::::::;;;;;;;
              ;;;:::::::::::::;;;;+++'##+'';;::::,,,,,.,..,,,,,::;;:,,...,,.................,:.,,:::::::::::::::::;;;;;
              ::::::::,::::::::;;;;'+++##'';;::::,,,,......,,::::;;::,....,,,,..............,,,,::::::::::::::::;:;;;;;
              ::;::::::::::::::;;;;;+++##'';;;;::,,,,,.....,::::::;:,,.....,,,,,......`......,,,::::::::::::::::;;;;;;;
              ::::::::::::::::::;;;;''+##+';;;;::,,,,....,,:;;;:::::,,,....,..,:,,..`......,,,,,::::::::::::::::::;;;;;
              ::::::::::::::::::;;;;';###+';;;;::,,,,,.,,,,:;;;::::::,,....,..,,::,..`......,,,.::::::::::::::::::::;:;
              :::::::::::::::::::;;;''+##+'';;;;::,,,,..,,,:;+;;;;;;;:,,,.,,,.,,,::,.......,,,.,:::::::::::::::::::::;;
              ::::::::::::::::::::';''+##+'';';;:::,,,,,,,,:;'+'+++';::,,,,';:,.,:::,......,,,,:::::::::::::::::::::;;:
              :::::::::::::::::::::''''##+'''';;::::,,,::::;;;''+++++;:::::::,,,,,;:,,,....,,:,:::::::::::::::::::::;;:
              ::::::::::::::::::::::'++###+''';;::::,:;;;;;''''++++++'''::;;::;:,,:':,,....,,::::::::::::::::::::::::;:
              ::::::::::::::::::::,,,,:###++++;;;::,,;'''''++++++++++';:;';';;;;;::;+:,,.,,,:;:::::::::::::::::::::::;;
              :::::::::::::::::,,::,::,#@###+++;::,,;'+'''++'''''''++';';';';:';;:;:'':,,,,:;':::::::::::::::::::::;:;;
              ::::::::::::::::::,::,:,,'######+';:,,+'''+++'+++'''''';;+''';;';;:;;;;+;,,,,;'+:::::::::::::::::::;;;;;;
              ::::::::::::::::::,,,,,,,;######+';:,'+';'+++++''+''''';:'''';;;;;;;'':'+:,,:;++::::::::::::::::::::::;;;
              ::::::::::::::::::,,,,,,,,#######+'::+'''+++++';';;;;;;:::;;,::,::;;;;;;';:::''+:::::::::::::::::::::::::
              ::::::::::::::,::,,:,,,,,,########';:+';'++++''''';;:;::::::::::::::;;;;';::;'++:::::::::::::::::::::::::
              :::::::::::::,,::,,,,,,,,,'######++;:+;''++##@#+++'+''';;;;;'''++'''''';+::''++;:::::::::::::::::::::::::
              ::::::::::::::,::,,,,,,,,,;#######+';';;'';'+#@#;;:;::::,,,,,:;##+'''';;';;'+#+::,:::::::::::::::::::::;:
              :::::::,::::::,:,,,,,,,,,,:#######++'';'':::;'''+++',,....,.:;++;;,::;;;;;;++#+:,,,:::,::::::::::::::::::
              ::::::::,,:::,,,,,,,,,,,,,:+######+#';''';:::;;;;:::;;;::,;;:::::,,:;;;;;';'#+;::,:,,,,::::::::::::::::::
              ::::::::::::,,,,,,,,,,,,,.,'#######++'''+':::;:;:::::,,,,,,,:::,,,,:;'':;;++#+:,,,,,:,,,:::::::::::::::::
              :::::::::::,,:,,,,,,,,,,,.,'########+''+'':::;;::::::,,,.,,,,,,,,,,:;+;;;'+#+;,,,,,,,,,,,,:::::::::::::::
              ::::::::::::,,,,,:,,,,,,,,,''@######+'''+':::;;;;::::,,,,,,,,,,,,,.,;++;''+++:,,,,,,,,,,,,:::::::::::::::
              :::::::::::::,,,,,,,,,,.,,.''+@@#####++'+'::::;;;;::::,,,,,,,,,,,.,:'+''++##;,,,,,,,,,,,,,,::::::::::;;::
              ::::::::::::,,,,,,,,,,,.,,.'''####@##+'++';;:::;;;;;;;;;;;:;::::,,,:'++'++#',,,,,,,,,,,,,,,:::::::::::;::
              ::,,::::::::,,,,,,,,,,,,,,,'''+###@###++++;;::::::;;''+'''''::,,,,:;+++####,,,,,,,,,,,,,,,,,:::::::::::::
              ::::::,::::,,,,,,,,,,,,,.,,'''''##@####++'';::::::::;''''';;:,,,,:;;++++##;,,,,,,,,,,,,,,,,,:::::::::::::
              :::::::,:::,,,,,,,,,,,,,,,,;''''+##@#####+''';:::::::;;;,::::,,::';''+#+#:,,,,,,,,,,,,,,,,:,,::::::::::::
              ::::::,,,:,,,,,,,,,,,,,,...;'''''+#@@###+#++';';;:::::,,,,,,:;:::''++###',,,,,,,,,,,,,,,,,,,,::::::::::::
              :::::::,,,,,,,,,,,,,,......:'''''++######+++''''';;;;:,,,,,,,::;;''''+++,:,,,,,,,,,,,,,,,,,,,,:::::::::::
              :::::::::,,,,,,,,,,,,,.,,.,:';''''++##@##+#+++++'';'::,,,,,,::::;''+###:,,,,,,,,,,,,,,,,,,:,:::::::::::::
              ::::::::,,,,,,,,,,,,,.,,,.#:''''''++++#@##+++'+'''';:::,:,,,:::''''+##:,,,,,,,,,,,,,,,,,,,,::::::::::::::
              :::::::,,,,,,,,,,,,,,,,,,'#,'''''''++++#######++++';;;:::,::;:;:''++#;:,,,,.,,,,,,,,,,,,,,,::::::::::::::
              :::::::,:,,,,,,,,,,,,,,,,@':;''''''+++++#####+++++''';;;::::;:;;+++#':,,,,,,,,,,,,,,,,,,,:::,::::::::::::
              :::::::,,,,,,,,,,,,,,,..#@:,,'''''+'++++'######+++'''';::;;;;;'''+#+:,,,,,,,,,,,,,,,,,,,,::,,,,,:::::::::
              ::::::,,,,,,,,,,,,,,,,,:@@::,,'''''''++++++####++++++'';;'''';+'+++:::,,,,,.,,,,,,,,,,,,,:,,,,,,:::::::::
              ::::,:,,,,,,,,,,,,...,,@@#',,,,';;''++++++++######+#++''''+++++#++::,,,,,,...,,,,,,,,,,,,:,,:::::::::::::
              :::::,,,,,,,,,,,,,,,..@@@@#:,,,,';;'''++++++++######+'+'+++++###';::,,,,,,.`,,,,,,,,,,,,,,,,::::,,:::::::
              :::::::::,,,,,,,,,,..@#@@##:,,,,,;;;'''+++++++''##############+:::,,,,,,,,`..,,,,,,,,,,,,,,,:::::,,,:::::
              ::::::::,,,,,,,,,,..##@@@#@:,,,,,,,;;''''+++++++';''++#####+;;;::,,,,,,.,:``:,,,,,,,,,,,,,,,,,,,,,,,,::::
              ,,::::,,,,,,,,,,,,.+##@@@@@:,,,,,...,'''''''++++++'';;;;;;;;;::,,,,,,,..,` .#:,,,,,,,,,,,,,,,,,,,,,,,::::
              :::::,,,,,,,,,,,.,+#@@@@@@##,,,,......,''''''''''''''''''';;::,,,,,,,.,,. `.##+,.,,,,,,,,,,,,,,,,,,,,::,:
              ::,:,,,,,,,,,,,,,;@@@#@@@@##:,,,,.......,;;;';'';;;;;;;;;;::,,,,,,,..,,,  `.#####':,,,,,,,,,,,,,,,,,,,:,:
              :::,,,,,,,,,,,,.'@###@@@@@##+,,,,..........:;;;;;;;;;;::::,,,,,,,,....,  ``.######@#@#+;,,,,,,,,,:::,,:,,
              ::,,,,,,,,,,,,;#@#######@@###,,,,............,:;;;:;:::,:,,,,,,,....,,    `.###############':,,,,,:::,:::
              :,,,,,,,,,,,'####@#@@########',,,...............,:::::,,,,,,,,,,.....    ``.###################+:,,,::,::
              ,,,:,,,,,:+####@#####@###@####:,,,........`````````,:,,,,,,,,...,.,.     ```#########################+;::
              :::::::+@######@##############;,,,,......`````````````,,,,,,,,..,,`      ``.#############################
              ::::###@###@@@@@###############:,,,.....`````````````` `..,....,,`       ``.+############################
              '##########@@@#@###############;,,,.....``````````````    `..,,,`       ```.+############################
              ########@@@@@@@@###############+:,,....``````````````       .,.`        ````+############################
              ####@@##@@@#@##@################;,,,...`````````````        .           ````+############################
              ########@@@@@##@################+;,,...`````````````        .:`        `````+############################
              ##########@@###@#################;:,...```````````          ;#+.      ``````+############################
              ######@@##@####@##################:,,...```````            ``,'@`    ```````'############################")
  kill_time <- Sys.time() + 5 * (12 * minutes)
  while(Sys.time() < as.POSIXct(strptime(kill_time, "%Y-%m-%d %H:%M:%S"))){
    msg <- mime()%>%
      from(from.email)%>%
      to(to.email)%>%
      subject(sample(subject_lines, 1:length(subject_lines)))%>%
      text_body(sample(bodies, 1:length(bodies)))
    send_message(msg)
  }
}





#===========================================================================#
#  Everything below this line is test code                                  #
#===========================================================================#




#msg <- mime() %>%
#  from("hitejc@umich.edu")%>%
#  to("hitejc@umich.edu")%>%
#  subject("Ryan is Out of the Office")%>%
#  text_body(
#    "Happy Holidays,
# 
#    I am currently out of the office and will have limited access to e-mail until Tuesday, January 3rd.
#    
#    Also, the Ross Development Office will be closed for the holidays starting on Friday, December 23rd at 2:00pm. We will reopen on Tuesday, January 3rd, 2017 at 8:00am.
#    
#    For 2016 charitable donations please find details below for various payment options.  Thank you very much for your support!
#    
#    Credit Card Gifts: Please visit us at https://leadersandbest.umich.edu/find/#!/scu/ross to give your gift online. Please note that credit cards must be successfully charged by 11:59PM EST on December 31st, 2016 to be counted for tax year 2016.
#    
#    If you would prefer to provide your credit card information over the phone please contact the Office of Gift and Records at 888-518-7888 (toll free) or 734-647-6179 (local). The office will be open the following days between the holidays:
#    
#    Monday, December 26                                      Closed
##    Tuesday, Dec. 27 – Friday, Dec. 30                   8:00am to 4:00pm
#  Monday, January 2                                           Closed
#    
#    Checks: Checks need to be dated and postmarked by December 31st, 2016 in order to be processed and credited as a 2016 gift.  Please mail all checks to the following address:
#    Ross School of Business  
#    Development & Alumni Relations
#    701 Tappan Street
#    Ann Arbor, MI 48109
#    Pay to the Order of: UM- Ross School of Business
#    Memo: Designation name and number (only if known)
#    
#    Gifts of Securities: Please contact the Gift and Records Administration Securities Team to assist you with processing via phone at 877-647-9090 or email umgiftsec@umich.edu. 
#    
#    Wire Transfers: Please contact Gift and Records Administration to assist with wire transfers.  They can be contacted by email at UMgiftCashWire@umich.edu or 888-518-7888.
#    
#    Have a safe and happy holiday and Go Blue!"
#  )




#for (i in 1:32){
#  x <- as.list(as.POSIXlt(strptime("2016-12-22 17:00:00", "%Y-%m-%d %H:%M:%S")))
#  x[i + 1] <- x[i] + 5*180
#}

#t1 <- as.POSIXlt(strptime("2016-12-22 17:00:00", "%Y-%m-%d %H:%M:%S"))
#t2 <- as.POSIXlt(strptime("2016-12-22 18:00:00", "%Y-%m-%d %H:%M:%S"))
#t3 <- as.POSIXlt(strptime("2016-12-22 19:00:00", "%Y-%m-%d %H:%M:%S"))
#t4 <- as.POSIXlt(strptime("2016-12-22 20:00:00", "%Y-%m-%d %H:%M:%S"))



#initTime <- Sys.time()


#while(Sys.time() < as.POSIXct(strptime("2016-12-21 16:34:00", "%Y-%m-%d %H:%M:%S"))){
#  if (as.integer(Sys.time() - as.POSIXct(strptime("2016-12-21 16:34:00", "%Y-%m-%d %H:%M:%S"))) < 0){
#    send_message(msg)
#  }
#}

#while(Sys.time() < time){
#  if (as.integer(Sys.time() - time.matrix[[1]][1]) == 0|
#         as.integer(Sys.time() - time.matrix[[2]][1]) == 0|
#         as.integer(Sys.time() - time.matrix[[3]][1]) == 0|
#         as.integer(Sys.time() - time.matrix[[4]][1]) == 0){
#    send_message(msg)
#  }
#}
