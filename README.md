Getting started...
==================

```
git clone https://BpCodingDojo@github.com/BpCodingDojo/FluentCalculator.git
```

### ...and finished

At the end of the session, please commit your work to the directory of your team.

```
git add .
git commit -a -m "Fokakrem"
git push
```

AnagramsKata
============

The main challenge of this kata is to find anagrams in a text input containing a list of words.
The output should be the same list of words but separated into groups where every word in a group
is an anagram of every other. A group should be printed in a single line.

For example, if the input is:

```
kinship
enlist
inlets
listen
pinkish
silent
```

then the output should be:

```
kinship pinkish
enlist inlets listen silent
```


### Challenge 1

* Every line in the input contains a single word.
* Anagrams are case-sensitive, so `parsley` and `Players` belong to separate groups.

### Challenge 2

* Anagrams are case-insensitive, so `parsley` and `Players` belong in the same group.

### Challenge 3

* The input can contain multiple words in a single line, separated by a space character.

### Considerations

Given an input such as the `wordlist.txt` file in the root directory of the repo,

* How fast is you algorithm?
* How much memory are you using?
