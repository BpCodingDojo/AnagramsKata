<?php

class FindAnagram {


    public function createKeyFromWord($word)
    {
        $word = str_split($word);
        sort($word);

        return implode('', $word);
    }

    public function find($input)
    {
        $words = explode("\n", $input);
        $groupedWords = $this->groupWords($words, array());

        $groupedWordLines = array();
        foreach ($groupedWords as $key => $group)
        {
            $groupedWordLines[] = $key . (!empty($group) ? " " . implode(' ', $group) : "");
        }

        return implode("\n", $groupedWordLines);
    }


    private function groupWords($words, $grouped)
    {
        if (empty($words))
        {
            return $grouped;
        }
        $firstWord = array_shift($words);
        $grouped[$firstWord] = array();
        foreach ($words as $key => $word)
        {
            if ($this->createKeyFromWord($word) == $this->createKeyFromWord($firstWord))
            {
                $grouped[$firstWord][] = $word;
                unset($words[$key]);
            }
        }
        return $this->groupWords($words, $grouped);
    }
}