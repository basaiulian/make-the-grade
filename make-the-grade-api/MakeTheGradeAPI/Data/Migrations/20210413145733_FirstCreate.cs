using Microsoft.EntityFrameworkCore.Migrations;

namespace MakeTheGradeAPI.Data.Migrations
{
    public partial class FirstCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            migrationBuilder.CreateTable(
                name: "EssayTest",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    question = table.Column<string>(type: "string", nullable: true),
                    assigner_id = table.Column<int>(type: "int", nullable: false),
                    essay_text = table.Column<string>(type: "string", nullable: true),
                    StudentId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EssayTest", x => x.id);
                    table.ForeignKey(
                        name: "FK_EssayTest_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Student",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
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
                    correctAnswer = table.Column<string>(type: "string", nullable: true),
                    StudentId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MultipleChoiceTest", x => x.id);
                    table.ForeignKey(
                        name: "FK_MultipleChoiceTest_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Student",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ShortAnswerTest",
                columns: table => new
                {
                    id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    question = table.Column<string>(type: "string", nullable: true),
                    assigner_id = table.Column<int>(type: "int", nullable: false),
                    answer = table.Column<string>(type: "string", nullable: true),
                    StudentId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShortAnswerTest", x => x.id);
                    table.ForeignKey(
                        name: "FK_ShortAnswerTest_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Student",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EssayTest_StudentId",
                table: "EssayTest",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_MultipleChoiceTest_StudentId",
                table: "MultipleChoiceTest",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_ShortAnswerTest_StudentId",
                table: "ShortAnswerTest",
                column: "StudentId");
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
