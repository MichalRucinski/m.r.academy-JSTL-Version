package database;

public class Student {
	private String name;
	private String surname;
	private String studentsClass;
	private int points;
	private String text;
	private String login;
	private int percentOfLevelCompleted;

	public Student() {
		
	}
	
	public Student(String name, String surname, String studentsClass, int points) {
		super();
		this.name = name;
		this.surname = surname;
		this.studentsClass = studentsClass;
		this.points = points;
	}
	
	public Student(String name, String surname, String login, String studentsClass, int points) {
		super();
		this.name = name;
		this.surname = surname;
		this.studentsClass = studentsClass;
		this.points = points;
		this.login = login;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getStudentsClass() {
		return studentsClass;
	}

	public void setStudentsClass(String studentsClass) {
		this.studentsClass = studentsClass;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public int getPercentOfLevelCompleted() {
		return percentOfLevelCompleted;
	}

	public void setPercentOfLevelCompleted(int percentOfLevelCompleted) {
		this.percentOfLevelCompleted = percentOfLevelCompleted;
	}
	
	public int[] getLevel() {
		
		int calcPoints = points;
		int result[] = new int[3];
		int[] levelArray = new int[100];
		int level=1;
		levelArray[0] = 100;
		
		for(int i=1; i<100; i++) {
			levelArray[i] = (int) (levelArray[i-1]*1.10);
		}
		
		while(calcPoints >= levelArray[level-1]) {
			calcPoints = calcPoints-levelArray[level-1];
			level++;
		}
		
		result[0] = level;
		result[1] = calcPoints;
		result[2] = levelArray[level-1];
		
		return result;
	}
	
	public String[] getTrophy(int level) {
		
		String[] trophyArray = new String[2];
		String trophyLabel = "<br/>";
		
		int whichTrophy = (int) level/10;
		whichTrophy = whichTrophy*10;
		
		if(whichTrophy == 10)
			trophyLabel = "puchar stalowy";
		else if(whichTrophy == 20)
			trophyLabel = "puchar posrebrzany";
		else if(whichTrophy == 30)
			trophyLabel = "puchar pozłacany";
		else if(whichTrophy == 40)
			trophyLabel = "puchar srebrny";
		else if(whichTrophy == 50)
			trophyLabel = "puchar topazowy";
		else if(whichTrophy == 60)
			trophyLabel = "puchar szafirowy";
		else if(whichTrophy == 70)
			trophyLabel = "puchar rubinowy";
		else if(whichTrophy == 80)
			trophyLabel = "puchar ametystowy";
		else if(whichTrophy == 90)
			trophyLabel = "puchar złoty";
		else if(whichTrophy == 100)
			trophyLabel = "puchar diamentowy";
		
		trophyArray[0] = Integer.toString(whichTrophy);
		trophyArray[1] = trophyLabel;
		
		return trophyArray;
	}
	
	public int getPercentOfLevelCompleted(int pointsInLevel, int allPointsInLevel) {
		
		float percent = ((float) pointsInLevel) / allPointsInLevel *100;
		
		return (int) percent;
	}
}
