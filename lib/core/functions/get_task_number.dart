int getTaskNumber({required String taskStatus}) {
  switch(taskStatus){
    case 'new':
      return 0;
    case 'processing':
      return 1;
      case 'completed':
      return 2;
    case 'notcompleted':
      return 3;
    case 'cancelled':
      return 4;
      default:
        return 5;
  }
}
