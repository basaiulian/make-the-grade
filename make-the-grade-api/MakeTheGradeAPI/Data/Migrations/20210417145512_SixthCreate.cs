using Microsoft.EntityFrameworkCore.Migrations;

namespace MakeTheGradeAPI.Data.Migrations
{
    public partial class SixthCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EssayTest",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    question = table.Column<string>(type: "string", nullable: true),
                    assigner_id = table.Column<int>(type: "int", nullable: false),
                    essay_text = table.Column<string>(type: "string", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EssayTest", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Exam",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    multiple_choice_id = table.Column<int>(type: "int", nullable: false),
                    short_answer_id = table.Column<int>(type: "int", nullable: false),
                    essay_test_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exam", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "MultipleChoiceTest",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    question = table.Column<string>(type: "string", nullable: true),
                    grader_id = table.Column<int>(type: "int", nullable: false),
                    possibleAnswers = table.Column<string>(type: "string", nullable: true),
                    correctAnswers = table.Column<string>(type: "string", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MultipleChoiceTest", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ShortAnswerTest",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    question = table.Column<string>(type: "string", nullable: true),
                    assigner_id = table.Column<int>(type: "int", nullable: false),
                    answer = table.Column<string>(type: "string", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShortAnswerTest", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "Student",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    username = table.Column<string>(type: "string", nullable: true),
                    password = table.Column<string>(type: "string", nullable: true),
                    email = table.Column<string>(type: "string", nullable: true),
                    phoneNumber = table.Column<string>(type: "string", nullable: true),
                    address = table.Column<string>(type: "string", nullable: true),
                    nr_matricol = table.Column<string>(type: "string", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Student", x => x.id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EssayTest");

            migrationBuilder.DropTable(
                name: "Exam");

            migrationBuilder.DropTable(
                name: "MultipleChoiceTest");

            migrationBuilder.DropTable(
                name: "ShortAnswerTest");

            migrationBuilder.DropTable(
                name: "Student");
        }
    }
}
