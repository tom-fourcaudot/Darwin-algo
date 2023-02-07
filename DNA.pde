class DNA {
  int len;
  char[] genes;
  int fitness;
  
  public DNA(int _len) {
    this.len = _len;
    this.genes = generateGenes(_len);
  }
  
  int calculateFitness(String target) {
    this.fitness = 0;
    for (int i = 0; i < this.len; i++) {
      if (genes[i] == target.charAt(i)) {
        this.fitness++;
      }
    }
    return this.fitness;
  }
  
  DNA crossover(DNA parent) {
    DNA child = new DNA(this.len);
    for (int i = 0; i < this.len; i++) {
      float choice = random(0, 1);
      if (choice > 0.5) {
        child.genes[i] = this.genes[i];
      } else {
        child.genes[i] = parent.genes[i];
      }
    }
    return child;
  }
  
  void mutation(float mutationRate) {
    for (int i = 0; i < this.len; i++) {
      if (random(0, 1) < mutationRate) {
        this.genes[i] = generateChar();
      }
    }
  }
  

}

char[] generateGenes(int len) {
    char[] res = new char[len];
    for (int i = 0; i < len; i++) {
      res[i] = generateChar();
    }
    return res;
}

char generateChar() {
  return (char) (' ' + int(random(0,94)));
}
