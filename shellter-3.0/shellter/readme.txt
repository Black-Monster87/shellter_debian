
	               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@          Shellter v3.1         @@@@@@@@@
	               @@@@@@@@          Coded By kyREcon          @@@@@@@
	               @@@@@@@@@      www.ShellterProject.com     @@@@@@@@
	               @@@@@@@@@@@@@@@@@@@.C@@@@@@@@@@C.:@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@.t@@@@@@@@@@L.;@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@;:@@@@@@@@@@L.:@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@G.@@@@@@@@@@L.:@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@..@@@@@@@@@@@..@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@;,@@@@@@@@@@@@..G;...lG@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@,f@@@@@@@@@@@@@@.......@@@@@@@@@@@
	               @@@@@@@@@@@@@@@l,@@@@@@@@@@@@@@@@@:...t@@@@@@@@@@@@
	               @@@@@@@@@@@@@l.l@@@@@@@@@@@@@@@@@@@i,@@@@@@@@@@@@@@
	               @@@@@@@@@@@@..G@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@
	               @@@@@@@fGG@@..@@L@@@@@@@@@@@@@@@@@@@@Cf@@@@@@@@@@@@
	               @@@@G........@@.@@L:@@@@@@@@@@@@@@@@@:@@@@@@@@@@@@@
	               @@@t.......,;@fL@l:@@@iL@@@@GtfCG@@@@.@@@@@@@@@@@@@
	               @@@@f@@Gf;..f@.@:.@@G..@@@@@..........:if@@@@@@@@@@
	               @@@@f@@@@@@;,f,;.@@,...@@@@@..................C@@@@
	               @@@@f@@@@@@@@C..Ll....i@@@@@f:,.......,......C@@@@@
	               @@@@f@@@@@@@@@@C,.....;@@@@@@@,G@@@l.:l;,..,L:@@@@@
	               @@@@f@@@@@@@@@,.,..,,@.:@@@@G.@GG@,:@@@l@@@@@:@@@@@
	               @@@@f@@@@@@@i...,..G@@,C.fi,.,@@.l@@@@@i@@@@@,@@@@@
	               @@@@f@@@@@C......f@@@@,@@Lf@G.,t@@@@@@@i@@@@@,@@@@@
	               @@@@f@@@@C;....i@@@@@@,@@@@@@@@l@@@@@@@i@@@@@,@@@@@
	               @@@@f@@@@@@@@l@@@@@@@@,@@@@@@@@l@@@@@@@i@@@@@,@@@@@
	               @@@@f@@@@@@@@i@@@@@@@@,@@@@@@@@l@@@@@@@i@@@@@,@@@@@
	               @@@@f@@@@@@@@i@@@@@@@@,@@@@@@@@l@@@@@@@i@@@@@,@@@@@
	               @@@@t@@@@@@@@i@@@@@@@@,@@@@@@@@l@@@@@@@i@@@@@,@@@@@
	               @@@@ C@@@@@@@i@@@@@@@@,@@@@@@@@l@@@@@@..@@@@@,@@@@@
	               @@L  C@@@@@@@i@@@@@@@@,@@@@@@@@l@@@@@  .@@@@@,@@@@@
	               @@ @ C@@@@@@@;@@@@@@@@,@@@@@@@@l@@@@@G;.@@@@@,@@@@@
	               @@@@ C@@@@@L  t@@@@@@@ @@@@@@@C .@@@@@;.@@@@. C@@@@
	               @@@@ C@@@@@ L@ @@@@@G  @@@@@@@ L.,@@@@;.@@@..L @@@@
	               @@@@ C@@@@@ @@ @@@@@ L @@@@@@G @G @@@@;.@@@ @@ G@@@
	               @@@@@@@@@@@ @@ @@@@@@G @@@@@@C @@ @@@@@@@@@ @@ C@@@
	               @@@@@@@@@@@ G@ @@@@@@G @@@@@@G @G @@@@@@@@@ G@ G@@@
	               @@@@@@@@@@@:  .@@@@@@G @@@@@@@ i :@@@@@@@@@: i @@@@
	               @@@@@@@@@@@@@@@@@@@@@G @@@@@@@@ ,@@@@@@@@@@@, @@@@@
	               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@




 Index
=======

    [1]  What is it?  
    [2]  How does it work?
    [3]  What does it trace?
    [4]  Why do I need Shellter?
    [5]  What types of apps can I use? 
    [6]  Can I use encoded/self-decrypting payloads?
    [7]  What is Thread Context Aware polymorphic code?
    [8]  What about self-modifying code?
    [9]  What about relocations?
    [10] What about Multi-Thread Applications?
    [11] what about Anti-Reversing tricks?
    [12] What if the target process dies during tracing?
    [13] What if an internal engine related error occurs?
    [14] How do execution flow filters work?
    [15] How much time does it need for tracing and log filtering?
    [16] What options does Shellter provide?
    [17] What is the purpose of verification stage?
    [18] System Requirements 
    [19] What should I do if I want to send feedback?
    [20] What should I do if I want to report a bug?
    [21] What should I do if I don't like it?



[1] What is it?  
================

Shellter is a dynamic shellcode injection tool aka dynamic PE infector. It can
be used in order to inject shellcode into native Windows applications
(currently 32-bit apps only). The shellcode can be something yours or something
generated through a framework, such as Metasploit.

Shellter takes advantage of the original structure of the PE file and doesn't
apply any  modification such as changing memory access permissions in sections
(unless the user wants to), adding an extra section with RWE access, and
whatever would look dodgy under an AV scan.


[2] How does it work?
======================

Shellter uses a unique dynamic approach which is based on the execution flow of
the target application. This means that no static/predefined locations are used
for shellcode injection. Shellter will launch and trace the target, while at
the same time will log the execution flow of the application.


[3] What does it trace?
========================

Shellter traces the entire execution flow that occurs in userland. 
That means, code inside the target application itself (PE image), and code
outside of it that might be in a system dll or on a heap, etc...
This happens in order to ensure that functions actually belonging to the target
executable, but are only used as callback functions for Windows APIs will not
be missed.

During tracing, Shellter will not log any instructions that are not in the
memory range of the PE image of the target application, since these cannot be
used as a reference to permanently inject the shellcode.


[4] Why do I need Shellter?
============================

Bypass AVs.

Executables created through Metasploit are most likely detected by most AV
vendors. By using Shellter, you automatically have an infinitely polymorphic
executable template, since you can use any 32-bit 'standalone' native Windows
executable to host your shellcode. By 'standalone' means an executable that 
doesn't need any proprietary DLLs, apart from the system DLLs to load and run.
For example, notepad.exe, and many other applications you can find online, or 
create by yourself as your own custom templates.

You can also use applications that make use of proprietary DLLs if those are
not required to create the process in the first place, and are normally loaded
later on if needed to execute code for a specific task. In case you select an
application that needs one or more proprietary DLLs to create the process in
the first place then you will have to include them in the same directory from
where you load the main executable. However, this is not recommended since it
is more convenient to have just a single executable to upload to the target.


[5] What types of apps can I use? 
==================================

You can basically use any 32-bit standalone (see above) native Windows
application. Of course, since the main goal is to bypass an AV, you should
always avoid packed applications or generally applications that have 'dodgy'
characteristics such as sections with RWE permissions, more than one sections
containing executable code etc..

Another reason why you should avoid packed applications is because advanced
packers will also check for modifications of the file, so you will probably
just break it. Advanced packers also perform various anti-reversing tricks
which will detect Shellter's debugging engine during tracing. If you are a
lover of packers, you can first perform the injection and then pack the
application with the packer of your choice.

The best bet is to use completely legitimate looking applications (ideally not
packed) that are not flagged by any AV vendor for any reason. 

These can be either yours, or something you got online.


[6] Can I use encoded/self-decrypting payloads?
================================================

Shellter also supports encoded/self-decrypting payloads by taking advantage of
the Imports Table of the application. It will look for specific imported APIs
that can be used on runtime to execute a self-decrypting payload without doing
any modifications in the section's characteristics from inside the PE Header.
These handlers can also by dynamically obfuscated (see [7]).

At the moment 7 methods are supported for loading encoded payloads:

0. VirtualAlloc
1. VirtualAllocEx
2. VirtualProtect
3. VirtualProtectEx
4. HeapCreate/HeapAlloc
5. LoadLibrary/GetProcAddress
6. CreateFileMapping/MapViewOfFile

If the target PE file doesn't import by default the necessary API(s) then 
a method wil be shown as 'N/A'.
If a method requires more than one APIs, like for example method 4,
it will also be shown as 'N/A' if the PE file doesn't import all of them.

If none of the encoded payload handler methods supported are available for
the current PE target, you can choose to either select a non-encoded payload
or to force Shellter to change the section's characteristics from inside the
PE Header.

This last option has been added in order to provide more flexibility to the
user in case he still wants to use a specific encoded payload along with the
same PE file.

When operating in Auto Mode, without cmdline arguments, Shellter will
automatically try to find all available methods and will use one at random.

If, the user has chosen to use these methods through the cmdline, but the
PE target doesn't support any of them, then Shellter will notify the user
and will automatically switch to section's characteristics modification.


[7] What is Thread Context Aware polymorphic code?
===================================================
This feature was introduced in Shellter v3.0 in order to enhance polymorphism
in the final output.
Shellter will break down a given algorithm or code block and will mix its
effective instructions with dynamically generated polymorphic code that does
not interfere with the logic of the original algorithm.


[8] What about self-modifying code?
====================================

Shellter is capable of recognizing self-modifying code and exclude those
locations from the available locations for shellcode injection, based on the
execution flow previously logged.

This is important in order to avoid injecting your shellcode into a location
where the code gets modified on runtime, which will break your shellcode.
Shellter will always perform these checks during the filtering stage either if
you choose to check for self-modifying code on runtime or not.

There is only one exception where the self-modifying code detection during
filtering might fail. This is in case the modified code, is changed back to its
original state before filtering the execution flow logs.

In order to avoid this issue, you can configure Shellter to notify you during
tracing immediately after stepping over the first instruction being part of
self-modifying code. You can then stop the tracing and use the already logged
execution flow path.

However, as already mentioned if you use legitimate and not packed applications,
you will hardly find any cases of self-modifying code, but even if you do
Shellter can handle this for you quite well either during tracing or later during
the filtering stages.


[9] What about relocations?
============================

Shellter, will disable dynamic ImageBase in the target executable in order to
avoid breaking your shellcode in case you inject it in an area where fixups
would normally occur during process loading.


[10] What about Multi-Thread Applications?
==========================================

Shellter is capable of keeping track of all the new threads created and trace
the executed instructions.
Tracing all the threads is optional, and must be activated by the user.

However, Shellter will always notify the user when a new thread has been
created, as well as upon its termination.

Generally, enabling Multi-Thread tracing is not necessary, but it can be of
vital importance in some scenarios.

For example, let's say we have two functions A and B and structurally speaking
function A is placed above B inside the PE file.
The main function will start a new thread to execute B and then when B is done,
the main function which, of course runs in the main thread, calls function A.

Now, in this case if Multi-Thread tracing was not enabled since Shellter didn't
keep track of function B it will not know later during the filtering stages
that bellow A there is another function that is actually executed before A so it
will allow the user to start injecting from somewhere inside function A which
will probably cause to partially overwrite function B.

But, since function B is executed before, this would break the execution before
we reach our shellcode.

As said, this is not a scenario you will have to deal with often. 
However, since Shellter will notify the user whenever a new thread is created,
the user can also choose next time to enable Multi-Thread tracing next time he
uses the same PE target.


[11] what about Anti-Reversing tricks?
======================================

-When running Shellter under Wine this feature is disabled for compatibility
reasons.-

Usually non-packed applications don't implement anti-reversing or
anti-debugging tricks.

However, Shellter is able to eliminate some basic debugging artifacts.

Currently Shellter clears the following PEB members:

PEB.IsBeingDebugged
PEB.NtGlobalFlag

Eventhough tracing code that implements such tricks is not what Shellter
was built for, I might add support for more of them in the future.


[12] What if the target process dies during tracing?
====================================================

Shellter will notify you about this and will give you the option to use the
already logged execution flow. In fact, you can kill the target process from
task manager, without affecting Shellter.


[13] What if an internal engine related error occurs?
======================================================

Shellter will notify you about this, by displaying a proprietary error message
and a Windows related error code.
Shellter will still give you the option of using the already logged execution
flow.
You can choose to notify the author about this.


[14] How do execution flow filters work?
=========================================

Once tracing has finished, or stopped by the user or for any other reason,
Shellter will trigger the 1st stage filtering. During this stage all
unnecessary logs will be eliminated in order to enhance the 2nd stage filtering
that performs more complex checks over the logged execution flow.

The 2nd stage filtering takes in consideration various parameters such as the
size of the polymorphic code added, the size of the actual payload, the
execution flow, etc...


[15] How much time does it need for tracing and log filtering?
===============================================================

Tracing time depends of the amount of instructions that the user wants to
trace, and of course the code complexity, and the power of the CPU. Generally,
code that makes frequent Calls to Windows APIs that need to jump into Kernel
back, will inevitably need more time to trace than code that doesn't.

Shellter will also treat instructions with REP prefixes differently than
others, in order to avoid keep stepping on them until ECX == 0. This is done in
order to enhance tracing speed on code that makes frequent use of those
instructions,and of course in order to avoid filling the tracing logs with
unnecessary duplicates that would be removed anyway later during the filtering
stage.

Finally, choosing to visually see the code running live during tracing, will
also slow down the engine since it will be required to disassemble and print
every instruction (see 'g' option in next section).
 
It's not a bug, it's a feature! :^P

Filtering speed also depends on the CPU capabilities and the complexity of the
code.


[16] What options does Shellter provide? 
=========================================

Read the Version_History.txt for more information about the most recent
changes.

Shellter will select automatically the compatible tracing engine, whether you
run it in a native Windows host or in Wine/Crossover.

Shellter offers two main modes of operation as described below.


Auto Mode:
-----------

Auto Mode supports command line. Run Shellter with -h argument to see more
information about it.

If command line is not used, the following options must be set individually by
the user:


a) Select target executable.

b) Select payload.


When operating in Auto mode, Shellter will trace a random number of
instructions for a maximum time of approximately 30 seconds.


If command line is not used the following features/options are automatically
set as follows:

i) Traces all threads in the target.

ii) Handles all payloads as encoded.

iii) Automates usage of encoded-payload handlers (section 6).

iv) Obfuscates those handlers by binding them with polymorphic code.

v) Generates and binds junk polymorphic code.

vi) Doesn't show real-time tracing. 




Manual Mode:
-------------

a) Choose target executable. This will host your shellcode.

b) Choose if you want to log thread context information or not. 

c) Choose number of instructions to trace. 

d) Choose to detect self-modifying code on tracing.
    d.1) If option 'd' is enabled you can choose to pause tracing if 
         self-modifying code is detected.  
    d.2) If option 'd.1' is enabled you can choose to stop tracing if
         self-modifying code is detected.

e) Trace just the main or all of the threads if more than one are created
   during tracing.

f) Show real time tracing. 

g) Select Payload.

h) Enable encoded payload handling or not.

   h.1) Choose between Encoded Payload Handlers or Section's Characteristics
        modification.

   h.2) If Encoded Payload Handlers are used (see [6]), the user can also
        choose to bind them with extra polymorphic code (see [7]).

i) Use User/Engine Polymorphic code.

    i.1) If the user creates his own polycode and option 'b' was enabled, he
         can take advantage of the logged thread context information.

j) Show Disassembled Entries

k) Select address to inject your shellcode.


[17] What is the purpose of the verification stage?
====================================================

Once injection has been completed successfully, Shellter will run the target
PE in order to verify that the execution flow will reach indeed the first
instruction of the injected code.
If polymorphic code has been used, then this refers to that and not to the
first instruction of the effective payload.
This test will run for a maximum time of 10 seconds.
If user interaction is required in order for the execution flow to reach
that instruction, then this test will not be able to perform the verification
unless you perform the necessary interaction with the application.
However, this does not mean that the injection process has failed.


[18] System Requirements 
=========================

It is recommended that you use Win XP SP3 (32/64-bit) and above.

* CPU: The better the faster. It's only a matter of time.

* RAM:
    Tracing 1 million instructions without Thread Context logging  => ~ 6 MBs
    Tracing 1 million instructions with Thread Context logging => ~ 28 MBs
    Tracing 10 million instructions without Thread Context logging => ~ 40 MBs
    Tracing 10 million instructions with Thread Context logging => ~ 270 MBs


[19] What should I do if I want to send feedback?
==================================================

Send an email with 'Subject: Shellter Feedback - <Short Description>' to 
ShellterProject@hotmail.com and I will be happy to go through it.

Please don't send emails complaining about stupid things, like the colour of
the fonts etc..  ...alright for the sake of Internet trolling, you can send
those emails, but most probably I will not have the time to troll back. 


[20] What should I do if I want to report a bug?
=================================================

Send an email with 'Subject: Shellter Bug - <Short Description>' to
ShellterProject@hotmail.com and I will be happy to go through it.


Please include:

    1.- Target Executable.
    2.- Configuration used.
    3.- Target Executable after injection.
    4.- Was the polymorphic code generated by you?
    5.- Was the payload, encoded or not, or any additional decryption stub for
        it created by you?
    6.- Which encoded payload handling method you used (VirtualAlloc,
        VirtualProtect etc..)
    7.- See point '2' again and ensure that you have included everything. :O)

Any information provided by you will not be made public. It will only be used
in order to troubleshoot Shellter, and it is necessary in order to determine if 
there is really a 'bug' in Shellter or there was something wrong done by the
user.


[21] What should I do if I don't like it?
==========================================

Delete it. Remember, that's free too!



Enjoy, 
kyREcon

