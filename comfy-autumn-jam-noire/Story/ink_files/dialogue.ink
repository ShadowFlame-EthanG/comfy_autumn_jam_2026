VAR newspaper = false
VAR asked = 0
VAR finalkatie = 0
VAR finaldopp = 0
VAR katie = false
VAR talkgirls = false

=== intro
This is a dialogue test.

case files will be delivered once this is over.

This sentence is meant to test how the animated text looks when you have a lot of words to make sure that things look correct and the text does not wrap infront of you, but is smooth! Hopefully this is a long enough dialogue text to be able to showcase this.

\*

* Where am I?
    -> choice1
* Can you tell me the time?
    -> choice2
* {newspaper} What did you see on the newspaper?
    -> choice3
-> DONE

=== choice1
You're in a diner, silly!

a
-> DONE

=== choice2
I dunno, can you read analog?

a
-> DONE

=== choice3
A blank slate. Ripe for creativity.

a
-> DONE

=== sister_intro
Oh thank God, they said you’d be here. My name's Margaret. I’m in a real bad way, I tell you. I’m sorry to barge in on a private detective like this without an appointment, but I haven’t got much time.

\*

* [Charmed. In that case, let’s not waste any time on pleasantries. Tell me about the case.] 
    It’s my sister, see. She’s missing. The cops think I did it. Like I’d hurt her, or something. I swear I didn’t. I need your help, bad. You’ve got to find her and clear my name. The cops will be here for me any minute now.

- So. Will you help me?

\*

* [I'll take the case.]
    Thanks. I heard you’re the best around. Here - as a token of my appreciation.
    
    It’s my sister’s - but if you find her, keep it. As a reward. She left it at my place, I was going to return it the night she disappeared, but by the time I got to her place, she was already gone.
    \*
    
* [I'll help, but I don't work for free.]
    I wouldn't expect you to. I've got money. My family's rich, see? Katie doesn’t like to flaunt our money around, but in this case, I’d say it’s worth it, don’tcha think?
    
    An advance. There’s more where that came from if you find her. 
    
    \*

- * [So, tell me about your sister.]
    -> question_sister
  
=== done_questioning
- Here. I swiped the case file from the police officers. I know that makes me look more guilty, but they already think I did it. What else could I do? You’re my last hope. Please, find my sister.

They’ll have already noticed that I took the file and are looking for me. We haven’t got a lot of time before they find out where I ran off to. Please, if anyone can solve this, you can.

\*

* [Okay, I’ll do what I can.]

-> DONE

=== question_sister
{asked < 3: \*} 
* [When was the last place you saw her?]
    A few days before she disappeared. At my place. She left some things there and I was going to return them to her when we went out dancing.
    ~ asked += 1
    -> question_sister
 * [Had you noticed anything strange about her recently?]
    Yeah. She’d been acting real paranoid. Always checking over her shoulder, like someone was following her. And she wouldn’t look in the mirror anymore. It was weird.
    ~ asked += 1
    -> question_sister
* [Know anyone who’d want to hurt her?]
    Everyone loved Katie. I can't imagine anyone doing anything like this to her.
    ~ asked += 1
    -> question_sister
* ->
    -> done_questioning
    

=== margaret_loop
\*

+ [Walk me through it again.]
    -> question_sister_loop

+ [Anything else you can tell me about your sister?]
    Um. No, I think that’s about it. She likes to go out dancing. She’s left handed. Little stuff like that, but I’m not sure how that helps the case. 
    -> margaret_loop
* [How do I know you're really innocent?]
    \*
    You really think I’d do that to my own sister and then run straight to a private detective? I guess you’ll just have to take my word for it. But there are things in that case file that just don’t add up.
    
    \*
    
    * * [Like what?]
        Well, it’s true that I have the only other key. But I’m telling you, I wasn’t there. So how’d the door get locked? I had my keys the whole time.
        -> margaret_loop


+ [I've solved the case!]
    -> case_solved
+ [Actually, one moment.]
    -> END



=== case_solved
Really? Are you sure?

\*

+ [Yes, I know what happened to your sister.]
    -> END
+ [Wait, no. I need more time to think.]
    -> margaret_loop

=== question_sister_loop
\*

* [When was the last place you saw her?]
    A few days before she disappeared. At my place. She left some things there and I was going to return them to her when we went out dancing.
    -> question_sister_loop
 * [Had you noticed anything strange about her recently?]
    Yeah. She’d been acting real paranoid. Always checking over her shoulder, like someone was following her. And she wouldn’t look in the mirror anymore. It was weird.
    -> question_sister_loop
* [Know anyone who’d want to hurt her?]
    Everyone loved Katie. I can't imagine anyone doing anything like this to her.
    -> question_sister_loop
+ [Nevermind.]
    -> margaret_loop

=== waitress_loop
\*

+ [Could I get more coffee?]
    Sure thing, hon.
    -> END
* [What are you going as for Halloween?]
    \*
    Hmmm. Why don’t I go as a private detective like you? No... A cop? Nah. A photographer, or maybe a professor! No no... Oh! I’ve got it. I’ll be a witch! 
    -> waitress_loop

* [I read something in the paper about changeling doubles. Know anything about that?]
    Oh yeah, tons. When I was a little girl, my gramma told me that they steal people through the mirror and take their place! Creepy, right?
    You can tell the difference, though. Doubles are always reverse copies of the original. ‘Cause they came from the mirror world. I knew a fella, Ed was his name, who had a mole on one side of his face. Shows up one day and it’s clear over on the other side! 
    He said it had always been that way, but I knew better. One o’ them doubles got him! No one ever believed me, though.
    -> waitress_loop

+ [Actually, I'm good.]
    -> END

-> DONE

=== the_choice
So. You think you’ve got it all figured out. Well then, detective. Which one of us is the real Katie? 

\*

-> DONE

=== katietalk
~talkgirls = true
{finalkatie == 0: -> final1}
{finalkatie  == 1: -> final2}
{finalkatie  == 2: -> final3}
{finalkatie  == 3: -> final4}
{finalkatie  == 4: -> final5}
{finalkatie  == 5: -> final6}
-> DONE

=== dopptalk
~talkgirls = true
{finaldopp == 0: -> dinal1}
{finaldopp == 1: -> dinal2}
{finaldopp == 2: -> dinal3}
{finaldopp == 3: -> dinal4}
{finaldopp == 4: -> dinal5}
{finaldopp == 5: -> dinal6}
-> DONE

=== final1
~ katie = true
Please, detective, you’ve got to know that it’s me. I’m the real Katie. Shoot her!
~ finalkatie += 1
\*
-> DONE

=== final2
~ katie = true
Don’t listen to a thing she has to say. You talked to my sister Margaret, right? She must have told you about me.
~ finalkatie += 1
\*
-> DONE

=== final3
~ katie = true
I’m so scared, I just want to go home and see my family. You have to shoot her and put an end to this!
~ finalkatie += 1
\*
-> DONE

=== final4
~ katie = true
She’s been watching me, learning everything about me, for... I don’t even know how long. She even copied my face...
~ finalkatie += 1
\*
-> DONE

=== final5
~ katie = true
She came in through the mirror... I tried to get rid of them all, but I forgot one. Stupid, stupid me. I don’t even remember opening it... just muscle memory, I suppose.
~ finalkatie += 1
\*
-> DONE

=== final6
~ katie = true
No, no, no, this isn’t happening. This isn’t real. Please, shoot her and make it all go away!
~ finalkatie = 0
\*
-> DONE

=== dinal1
~ katie = false
Shoot her, detective! Oh God, please shoot her! She’s trying to keep me here in this place forever!
~ finaldopp += 1
-> DONE

=== dinal2
~ katie = false
This place only exists while she’s alive. She’s keeping us both here! We’ll be stuck here forever unless you shoot her! 
~ finaldopp += 1
-> DONE

=== dinal3
~ katie = false
All I wanted to do was go out dancing... I don’t even know how I got mixed up in this anyway. 
 Please, get me out of this and you can have anything you want. I’m begging you.
 ~ finaldopp += 1
-> DONE

=== dinal4
~ katie = false
I kept seeing her move in the mirrors... Oh God, the mirrors. It looked like me, but it wasn’t. It moved on its own. I couldn’t stand it. 
~ finaldopp += 1
-> DONE

=== dinal5
~ katie = false
You’ve got to believe me, detective, I’m the real Katie! 
~ finaldopp += 1
-> DONE

=== dinal6
~ katie = false
My family’s got money. Please, get me out of this and you can have anything you want. I’m begging you.
~ finaldopp = 0
-> DONE
=== dopp_lives
~ talkgirls = false
Oh.. This feeling...

You really shot her, didn’t you? 

I’m alive... I’m... I’m... Real. Ha. Ha ha. And dear detective, why it’s all thanks to you! I have only you to thank for this wonderful gift! 

And now that I’ve been given this taste of life, why, it’s only right to share it. I have friends, you see, who would l o v e to know what this feels like. And now that I’m here...

I can help them pick a body, too.

\*
-> DONE

=== katie_lives
~talkgirls = false
You did it... Oh thank God, you did it. How did you know? How did you know it was me? 

Well, in any case, i owe you my life. And more, I’m sure Margaret has promised you some sort of reward. What was that thing?

Well, in any case, i owe you my life. And more, I’m sure Margaret has promised you some sort of reward. What was that thing? It... it came out of my mirror.

I’m so relieved. I never thought I’d make it back. I need to find...

Margaret!

... Katie!

\*
-> DONE
