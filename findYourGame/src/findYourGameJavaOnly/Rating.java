package findYourGameJavaOnly;

public class Rating {
	
	private double currentRating;
	private int ratings;
	
	public Rating() {
		this.currentRating = 0;
		this.ratings = 0;
	}

	public double getCurrentRating() {
		return currentRating;
	}

	public void setCurrentRating(double currentRating) {
		this.currentRating = currentRating;
	}

	public int getRatings() {
		return ratings;
	}

	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	
	public void considerNewRating(int newRating) {
		int prevRatings = this.getRatings();
		double newCurrentRating = (this.getCurrentRating() * prevRatings) / prevRatings + 1;
		this.setCurrentRating(newCurrentRating);
		this.setRatings(++prevRatings);	
	}
}
