#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <string.h>

struct Duration
{
	int minutes;
	int seconds;
};

struct Song
{
	char performer[40];
	int year;
	char album[40];
	char album_type[20];
	char name[80];
	struct Duration duration;
};

void song_write(FILE* out, const char* performer,
	int year, const char* album, const char* album_type,
	const char* name, int minutes, int seconds)
{
	struct Song song;

	memset(&song, 0, sizeof(struct Song));

	strcpy_s(song.performer, sizeof(song.performer), performer);
	song.year = year;
	strcpy_s(song.album, sizeof(song.album), album);
	strcpy_s(song.album_type, sizeof(song.album_type), album_type);
	strcpy_s(song.name, sizeof(song.name), name);
	song.duration.minutes = minutes;
	song.duration.seconds = seconds;

	fwrite(&song, sizeof(struct Song), 1, out);
}

void create_database()
{
	FILE* out = fopen("songs.dat", "wb+");

	song_write(out, "Ed Sheeran", 2011, "+", "CD", "The A Team", 4, 18);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Drunk", 3, 20);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "U.N.I.", 3, 48);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Grade 8", 2, 59);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Wake Me Up", 3, 49);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Small Bump", 4, 19);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "This", 3, 15);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "The City", 3, 54);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Lego House", 3, 5);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "You Need Me, I Don't Need You", 3, 40);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Kiss Me", 4, 40);
	song_write(out, "Ed Sheeran", 2011, "+", "CD", "Give Me The Love", 8, 46);

	song_write(out, "Ed Sheeran", 2014, "×", "CD", "One", 4, 13);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "I'm a Mess", 4, 6);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Sing", 3, 55);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Don't", 3, 39);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Nina", 3, 43);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Photograph", 4, 17);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Bloodstream", 4, 59);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Tenerife Sea", 4, 0);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Runaway", 3, 26);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "The Man", 4, 9);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Thinking Out Loud", 4, 40);
	song_write(out, "Ed Sheeran", 2014, "×", "CD", "Afire Love", 4, 58);
	
	song_write(out, "Ed Sheeran", 2011, "The A Team", "Single", "The A Team", 4, 18);
	song_write(out, "Ed Sheeran", 2012, "Drunk", "Single", "Drunk", 3, 20);

	song_write(out, "Nothing but Thieves", 2012, "To Fly You've Got to Fall", "Single", "To Fly You've Got to Fall", 4, 34);

	song_write(out, "Greta Van Fleet", 2017, "Black Smoke Rising", "EP", "Highway Tune", 3, 1);
	song_write(out, "Greta Van Fleet", 2017, "Black Smoke Rising", "EP", "Safari Song", 3, 56);
	song_write(out, "Greta Van Fleet", 2017, "Black Smoke Rising", "EP", "Flower Power", 5, 13);
	song_write(out, "Greta Van Fleet", 2017, "Black Smoke Rising", "EP", "Black Smoke Rising", 4, 21);

	fclose(out);
}

void song_read(FILE* in, struct Song* song)
{
	fread(song, sizeof(struct Song), 1, in);
}

void select_ed_sheeran_2011()
{
	FILE* in = fopen("songs.dat", "rb");
	struct Song song;

	while (!feof(in)) {
		song_read(in, &song);

		if (strcmp(song.performer, "Ed Sheeran") == 0
			&& song.year == 2011
			&& strcmp(song.album_type, "CD") == 0) {
			printf("%s %02d:%02d\n", song.name, song.duration.minutes, song.duration.seconds);
		}
	}

	fclose(in);
}


void main()
{
	create_database();
	select_ed_sheeran_2011();
}
