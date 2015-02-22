run_analysis <- function() {
  require(dplyr)
  require(tidyr)
  require(stringr)
  
  # Get train and test data with subjectIds and activity names
  train_data <- parse_dataset("train")
  test_data <- parse_dataset("test")
  
  # Merge test and train datasets 
  all_data <- bind_rows(train_data, test_data)
  
  # Change column names to more descriptive labels
  names(all_data) <- make.names(names(all_data))
  names(all_data) <- str_replace_all(names(all_data), "^(f)", "Freq")
  names(all_data) <- str_replace_all(names(all_data), "^(t)", "Time")
  names(all_data) <- str_replace_all(names(all_data), "(Body)\\1", "Body")
  names(all_data) <- str_replace_all(names(all_data), "(\\.)+", "")
  names(all_data) <- str_replace_all(names(all_data), "std", "Std")
  names(all_data) <- str_replace_all(names(all_data), "mean", "Mean")
  names(all_data) <- str_replace_all(names(all_data), "jerk", "Jerk")
  
  # Grouping dataset by subject and activity, 
  # calculate mean for all features,
  # order dataset by subject and activity
  mean_data <- all_data %>% 
    group_by(SubjectId, Activity) %>%
    summarise_each(funs(mean)) %>%
    arrange(SubjectId, Activity)
  
  # Return result dataset 
  mean_data    
}

parse_dataset <- function(dataset_type) {
  # Get pathes to all necessary files
  root_path <- "UCI HAR Dataset/"
  dataset_path <- paste0(root_path, dataset_type, "/X_", dataset_type, ".txt")
  activity_path <- paste0(root_path, dataset_type, "/y_", dataset_type, ".txt")
  subject_path <- paste0(root_path, dataset_type, "/subject_", 
                         dataset_type, ".txt")
  activity_labels_path <- paste0(root_path, "activity_labels.txt")
  features_path <- paste0(root_path, "features.txt")
  
  # Get features and name the columns
  features <- read.table(features_path, stringsAsFactors = FALSE)
  names(features) <- c("FeatureId", "Feature")
  
  # If there are any duplicate column names, create unique column names
  dupNum <- sum(table(features$Feature) > 1)
  if (dupNum > 0) {
    features$Feature <- make.unique(features$Feature)
  }
  
  # Get experimental dataset and name the columns using feature names
  dataset <- read.table(dataset_path)
  names(dataset) <- features$Feature
  
  # Get only variables, which column names contains "mean()" or "std()"
  dataset <- select(dataset, matches("mean\\(\\)|std\\(\\)"))
  
  # Get activity ids for each observation
  activity <- read.table(activity_path)
  names(activity) <- "ActivityId"
  
  # Get mapping between activity ids and activity names
  activity_labels <- read.table(activity_labels_path, stringsAsFactors = FALSE)
  names(activity_labels) <- c("ActivityId", "Activity")
  
  # Merge activity ids for each observation with activity names
  activity_data <- inner_join(activity, activity_labels, by = "ActivityId")
  
  # Get subjects
  subject <- read.table(subject_path)
  names(subject) <- "SubjectId"
  
  # Create result dataset using data with subjects, activity names
  # and experimental dataset
  dataset <- bind_cols(subject, activity_data["Activity"], dataset)
  
  # Return result dataset
  dataset
}