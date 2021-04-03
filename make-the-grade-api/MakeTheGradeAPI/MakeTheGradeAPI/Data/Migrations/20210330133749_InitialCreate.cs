using Microsoft.EntityFrameworkCore.Migrations;

namespace MakeTheGradeAPI.Data.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Username = table.Column<string>(type: "TEXT", nullable: true),
                    Password = table.Column<string>(type: "TEXT", nullable: true),
                    Email = table.Column<string>(type: "TEXT", nullable: true),
                    PhoneNumber = table.Column<string>(type: "TEXT", nullable: true),
                    Address = table.Column<string>(type: "TEXT", nullable: true),
                    Discriminator = table.Column<string>(type: "TEXT", nullable: false),
                    Grade = table.Column<float>(type: "REAL", nullable: true),
                    NumarMatricol = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Test",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Question = table.Column<string>(type: "TEXT", nullable: true),
                    Score = table.Column<float>(type: "REAL", nullable: false),
                    AssignerId = table.Column<int>(type: "INTEGER", nullable: true),
                    Discriminator = table.Column<string>(type: "TEXT", nullable: false),
                    EssayText = table.Column<string>(type: "TEXT", nullable: true),
                    EssayTest_StudentId = table.Column<int>(type: "INTEGER", nullable: true),
                    CorrectAnswer = table.Column<string>(type: "TEXT", nullable: true),
                    MultipleChoiceTest_StudentId = table.Column<int>(type: "INTEGER", nullable: true),
                    Answer = table.Column<string>(type: "TEXT", nullable: true),
                    StudentId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Test", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Test_User_AssignerId",
                        column: x => x.AssignerId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Test_User_EssayTest_StudentId",
                        column: x => x.EssayTest_StudentId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Test_User_MultipleChoiceTest_StudentId",
                        column: x => x.MultipleChoiceTest_StudentId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Test_User_StudentId",
                        column: x => x.StudentId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Test_AssignerId",
                table: "Test",
                column: "AssignerId");

            migrationBuilder.CreateIndex(
                name: "IX_Test_EssayTest_StudentId",
                table: "Test",
                column: "EssayTest_StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Test_MultipleChoiceTest_StudentId",
                table: "Test",
                column: "MultipleChoiceTest_StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_Test_StudentId",
                table: "Test",
                column: "StudentId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Test");

            migrationBuilder.DropTable(
                name: "User");
        }
    }
}
