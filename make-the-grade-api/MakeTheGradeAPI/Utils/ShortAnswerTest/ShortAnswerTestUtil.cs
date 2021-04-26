using MakeTheGradeAPI.Entities;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace MakeTheGradeAPI.Utils.ShortAnswerTests
{
    public static class ShortAnswerTestUtil
    {
        public static List<ShortAnswerTest> GetRandomTestsList(int numberOfQuestions, List<ShortAnswerTest> shortAnswerTests)
        {
            List<ShortAnswerTest> shortAnswerTestsCopy = shortAnswerTests;
            List<ShortAnswerTest> result = new();
            while (result.Count < numberOfQuestions)
            {
                ShortAnswerTest randomTest = shortAnswerTestsCopy[RandomNumberGenerator.GetInt32(shortAnswerTestsCopy.Count)];
                result.Add(randomTest);
                shortAnswerTestsCopy.Remove(randomTest);
            }

            return result;
        }
    }
}
