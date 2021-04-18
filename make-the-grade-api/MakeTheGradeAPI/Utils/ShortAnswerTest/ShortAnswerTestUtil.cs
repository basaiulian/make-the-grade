using MakeTheGradeAPI.Entities;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace MakeTheGradeAPI.Utils.ShortAnswerTests
{
    public static class ShortAnswerTestUtil
    {
        public static List<ShortAnswerTest> getRandomTestsList(int numberOfQuestions, List<ShortAnswerTest> shortAnswerTests)
        {
            List<ShortAnswerTest> shortAnswerTestsCopy = shortAnswerTests;
            List<ShortAnswerTest> result = new List<ShortAnswerTest>();
            while (result.Count < numberOfQuestions)
            {
                ShortAnswerTest RandomTest = shortAnswerTestsCopy[RandomNumberGenerator.GetInt32(shortAnswerTestsCopy.Count)];
                result.Add(RandomTest);
                shortAnswerTestsCopy.Remove(RandomTest);
            }

            return result;
        }
    }
}
