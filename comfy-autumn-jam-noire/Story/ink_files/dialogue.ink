VAR newspaper = false
VAR asked = 0

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

* Charmed. In that case, let’s not waste any time on pleasantries. Tell me about the case. 
    It’s my sister, see. She’s missing. The cops think I did it. Like I’d hurt her, or something. I swear I didn’t. I need your help, bad. You’ve got to find her and clear my name. The cops will be here for me any minute now.

- So. Will you help me?

\*

* I'll take the case.
    Thanks. I heard you’re the best around. Here - as a token of my appreciation.
    
    It’s my sister’s - but if you find her, keep it. As a reward. She left it at my place, I was going to return it the night she disappeared, but by the time I got to her place, she was already gone.
    \*
    
* I'll help, but I don't work for free.
    I wouldn't expect you to. I've got money. My family's rich, see? Katie doesn’t like to flaunt our money around, but in this case, I’d say it’s worth it, don’tcha think?
    
    An advance. There’s more where that came from if you find her. 
    
    \*

- * So, tell me about your sister. []
    -> question_sister
  
=== done_questioning
- Here. I swiped the case file from the police officers. I know that makes me look more guilty, but they already think I did it. What else could I do? You’re my last hope. Please, find my sister.

They’ll have already noticed that I took the file and are looking for me. We haven’t got a lot of time before they find out where I ran off to. Please, if anyone can solve this, you can.

\*

* Okay, I’ll do what I can.
    
-> DONE

=== question_sister
{asked < 3: \*} 
* When was the last place you saw her?
    A few days before she disappeared. At my place. She left some things there and I was going to return them to her when we went out dancing.
    ~ asked += 1
    -> question_sister
 * Had you noticed anything strange about her recently?
    Yeah. She’d been acting real paranoid. Always checking over her shoulder, like someone was following her. And she wouldn’t look in the mirror anymore. It was weird.
    ~ asked += 1
    -> question_sister
* Know anyone who’d want to hurt her?
    Everyone loved Katie. I can't imagine anyone doing anything like this to her.
    ~ asked += 1
    -> question_sister
* ->
    -> done_questioning
