class Population {
  int nbGeneration;
  String target;
  float mutationRate;
  int popSize;
  int totalFitness;
  int bestFitness;
  DNA[] pop;
  DNA[] matingPool;
  
  public Population(String _target, int _popSize, float _mutationRate) {
    this.nbGeneration = 1;
    this.target = _target;
    this.popSize = _popSize;
    this.mutationRate = _mutationRate;
    this.pop = new DNA[this.popSize];
    for (int i = 0; i < this.popSize; i++) {
      pop[i] = new DNA(target.length());
    }
  }
  
  // Calculate the fitness of each element
  void calcFitness() {
    this.totalFitness = 0;
    for (DNA d : pop) {
      this.totalFitness += d.calculateFitness(this.target);
    }
  }
  
  // Make natural selection according to fitness of element
  void naturalSelection() {
    this.matingPool = new DNA[this.totalFitness];
    int count = 0;
    for (DNA d : pop) {
      for (int i = 0; i < d.fitness; i++) {
        this.matingPool[count] = d;
        count++;
      }
    }
  }
  
  // Generate the next generation
  void generate() {
    for (int i = 0; i < this.popSize; i++) {
      DNA parentA = this.matingPool[int(random(0, matingPool.length))];
      DNA parentB = this.matingPool[int(random(0, matingPool.length))];
      DNA child = parentA.crossover(parentB);
      child.mutation(this.mutationRate);
      this.pop[i] = child;
    }
    this.nbGeneration++;
  }
  
  // Check if one of the element reach the target
  boolean isFinished() {
    boolean res = false;
    for (DNA d : this.pop) {
      if (d.fitness == this.target.length()) {
        res = true;
      }
    }
    return res;
  }
  
  // Show best element
  void showBest(boolean reached) {
    int maxi = -1;
    DNA best = this.pop[0];
    for (DNA d : this.pop) {
      if (d.fitness > maxi) {
        maxi = d.fitness;
        best = d;
      }
    }
    if (reached) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    this.bestFitness = maxi;
    String s = new  String(best.genes);
    textSize(44);
    textAlign(CENTER, CENTER);
    text(s, width/2, height/2);
  }
  
  // Draw basic info
  void drawInfo(boolean reached) {
    this.showBest(reached);
    // Show nb of gen
    fill(255);
    textAlign(LEFT, TOP);
    textSize(20);
    text("Generation : " +this.nbGeneration, 10, 10);
    text("Average fitness : "+int(float(this.totalFitness)/(this.popSize*this.target.length())*100)+"%", 10, 30);
    text("Best fitness : "+int(float(this.bestFitness)/this.target.length()*100)+"%", 10, 50);
    // show population information
    textAlign(RIGHT, TOP);
    text("Population size : " +this.popSize, width-10, 10);
    text("Mutation rate : " +int(this.mutationRate*100)+"%", width-10, 30);
  }
}
