using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Exam
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("multiple_choice_id", TypeName = "int")]
        public int MultipleChoiceTestId { get; set; } = -1;

        [Column("short_answer_id", TypeName = "int")]
        public int ShortAnswerTestId { get; set; } = -1;

        [Column("essay_test_id", TypeName = "int")]
        public int EssayTestId { get; set; } = -1;
    }
}
