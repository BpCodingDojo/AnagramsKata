<?php
require_once 'FindAnagram.php';

class Test extends PHPUnit_Framework_TestCase {


    /**
     * @var FindAnagram
     */
    private $generator;

    public function setUp()
    {
        parent::setUp();
        $this->generator = new FindAnagram();
    }


    /**
     * @dataProvider getWordsAndExpectedKeys
     */
    public function testCreateKeyFromWord_ShouldReturnSortedChars($word, $expectedKey)
    {
        $key = $this->generator->createKeyFromWord($word);

        $this->assertEquals($expectedKey, $key);
    }


    public function getWordsAndExpectedKeys()
    {
        return array(
            array('kinship', 'hiiknps'),
            array('a', 'a'),
            array('enlist', 'eilnst'),
        );
    }


    public function testCreateKeyFromWord_ShouldReturnTheSameSortedCharsForAnagrams()
    {
        $key1 = $this->generator->createKeyFromWord('kinship');
        $key2 = $this->generator->createKeyFromWord('pinkish');

        $this->assertEquals($key1, $key2);
    }


    public function getWordsAndExpectedGroups()
    {
        return array(
            array("kinship\npinkish", "kinship pinkish"),
            array("kinship\npinkish\na", "kinship pinkish\na"),
            array("kinship\na\npinkish", "kinship pinkish\na"),
            array("kinship\npinkish\nkishpin\na", "kinship pinkish kishpin\na"),
            array("enlist\ninlets\nlisten\nsilent", "enlist inlets listen silent"),
            array("a\nkinship\npinkish", "a\nkinship pinkish"),
            array("a\nkinship\npinkish", "a\nkinship pinkish"),
            array("kinship\nenlist\ninlets\nlisten\npinkish\nsilent", "kinship pinkish\nenlist inlets listen silent"),
        );
    }


    /**
     * @dataProvider getWordsAndExpectedGroups
     */
    public function testFind_ItShouldGroupAnagrams($input, $expectedWords)
    {
        $groupedWords = $this->generator->find($input);

        $this->assertEquals($expectedWords, $groupedWords);
    }
}
